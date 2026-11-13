import AppKit

// `fix_clipboard` cleans the clipboard in place.
// `fix_clipboard -` filters stdin to stdout, for tests and pipes.
if CommandLine.arguments.dropFirst().first == "-" {
    let input = String(decoding: FileHandle.standardInput.readDataToEndOfFile(), as: UTF8.self)
    let result = TerminalText.unwrap(input)
    print(result, terminator: result.hasSuffix("\n") ? "" : "\n")
} else {
    let pasteboard = NSPasteboard.general
    guard let text = pasteboard.string(forType: .string) else {
        FileHandle.standardError.write(Data("fix_clipboard: the clipboard holds no text\n".utf8))
        exit(1)
    }
    pasteboard.clearContents()
    pasteboard.setString(TerminalText.unwrap(text), forType: .string)
}
