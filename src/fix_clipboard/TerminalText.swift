/// Cleans text copied out of a terminal UI: drops the left margin, tool glyphs,
/// line-number prefixes and ANSI codes, and rejoins hard-wrapped lines.
/// Fenced code blocks, tables and list items keep their line breaks.
enum TerminalText {
    static func unwrap(_ text: String) -> String {
        var unwrapper = Unwrapper()
        for line in prepare(text) {
            unwrapper.consume(line)
        }
        return unwrapper.finish().joined(separator: "\n")
    }

    static func prepare(_ text: String) -> [String] {
        let lines = text
            .split(omittingEmptySubsequences: false) { $0 == "\n" || $0 == "\r\n" }
            .map { String($0).replacing(ansiEscape, with: "") }
        return dedent(stripLineNumbers(lines).map(stripMarkers))
    }

    // Indentation ahead of a marker is UI padding, so it goes too; lines
    // without a marker keep theirs, which is what dedent works from.
    static func stripMarkers(_ line: String) -> String {
        guard let match = line.prefixMatch(of: marker) else { return line }
        return String(line[match.range.upperBound...])
    }

    /// Only fires when most non-blank lines carry a prefix, so lists survive.
    static func stripLineNumbers(_ lines: [String]) -> [String] {
        let body = lines.filter(\.hasContent)
        let hits = body.filter { $0.prefixMatch(of: lineNumber) != nil }
        guard Double(hits.count) >= max(2, 0.6 * Double(body.count)) else { return lines }
        return lines.map { line in
            guard line.hasContent, let match = line.prefixMatch(of: lineNumber) else { return line }
            return String(line[match.range.upperBound...])
        }
    }

    static func dedent(_ lines: [String]) -> [String] {
        let pad = lines.filter(\.hasContent).map(\.leadingWhitespaceCount).min() ?? 0
        return lines.map { $0.hasContent ? String($0.dropFirst(pad)).trimmingTrailingWhitespace : "" }
    }

    private static var marker: Regex<Substring> { #/(?:\s*)(?:[⏺⏵⎿│┃▏▎▍▌▋▊▉█▐▕┆┊╎┋├└╵╷●○✻✽⧉]\s*)+/# }
    private static var lineNumber: Regex<Substring> { #/\s*\d+(?:\t|\s*[|│→]\s?)/# }
    private static var ansiEscape: Regex<Substring> {
        #/\x{1B}\[[0-9;?]*[ -\/]*[@-~]|\x{1B}\][^\x{07}\x{1B}]*(?:\x{07}|\x{1B}\\)/#
    }
}

enum LineKind: Equatable {
    case fence
    case blank
    case tableRow
    case listItem
    case prose

    init(_ trimmed: String) {
        if trimmed.hasPrefix("```") || trimmed.hasPrefix("~~~") {
            self = .fence
        } else if trimmed.isEmpty {
            self = .blank
        } else if trimmed.hasPrefix("|") {
            self = .tableRow
        } else if trimmed.prefixMatch(of: LineKind.bullet) != nil {
            self = .listItem
        } else {
            self = .prose
        }
    }

    private static var bullet: Regex<Substring> { #/(?:[-*•‣▪◦]|\d+[.)]|[a-zA-Z][.)])\s+/# }
}

struct Unwrapper {
    private(set) var output: [String] = []
    private var paragraph: [String] = []
    // An unclosed fence protects the remainder rather than silently flattening it.
    private var inFence = false

    mutating func consume(_ line: String) {
        let trimmed = line.trimmingWhitespace
        let kind = LineKind(trimmed)
        if kind == .fence {
            flush()
            output.append(line)
            inFence.toggle()
            return
        }
        if inFence {
            output.append(line)
            return
        }
        switch kind {
        case .fence, .prose:
            paragraph.append(trimmed)
        case .blank:
            flush()
            output.append("")
        case .tableRow:
            flush()
            output.append(trimmed)
        case .listItem:
            flush()
            paragraph.append(trimmed)
        }
    }

    mutating func finish() -> [String] {
        flush()
        return output
    }

    private mutating func flush() {
        guard let first = paragraph.first else { return }
        let joined = paragraph.dropFirst().reduce(first) { joined, next in
            joined + (Self.endsInWrappedToken(joined) ? "" : " ") + next
        }
        output.append(joined.replacing(#/[ \t]+/#, with: " ").trimmingWhitespace)
        paragraph.removeAll()
    }

    // A token split across a wrap keeps its hyphen and loses the gap,
    // so URLs survive: "claude-" + "code/issues" -> "claude-code/issues".
    static func endsInWrappedToken(_ text: String) -> Bool {
        guard text.last == "-", let before = text.dropLast().last else { return false }
        return before.isASCII && (before.isLetter || before.isNumber || "/._".contains(before))
    }
}

extension String {
    var hasContent: Bool { !allSatisfy(\.isWhitespace) }
    var leadingWhitespaceCount: Int { prefix(while: \.isWhitespace).count }
    var trimmingTrailingWhitespace: String {
        String(reversed().drop(while: \.isWhitespace).reversed())
    }
    var trimmingWhitespace: String { String(drop(while: \.isWhitespace)).trimmingTrailingWhitespace }
}
