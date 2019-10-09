#!/opt/local/bin/python
# -*- coding: utf-8 -*-
from __future__ import unicode_literals
from __future__ import print_function
from plistlib import readPlist, writePlist
from sys import stdin, stdout


def main():
    #plist_string = sys.stdin.read()
    # Reads plist from standard input and writes it back to standard output
    # sorted by key.
    plist = readPlist(stdin)
    writePlist(plist, stdout)


if __name__ == "__main__":
    main()
