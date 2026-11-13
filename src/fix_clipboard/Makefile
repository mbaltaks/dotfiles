BIN := ../../bin/fix_clipboard

.PHONY: build test

build:
	xcrun swiftc -O -swift-version 6 -target arm64-apple-macos14 -o $(BIN) TerminalText.swift main.swift

test: build
	./test $(BIN)
