#!/usr/bin/env python
# -*- coding: utf-8 -*-
from __future__ import unicode_literals
from __future__ import print_function
import os
import sys
import json
import subprocess

def main():
    split_file_path = os.path.join('/tmp/', 'xct_compare_split_')
    fulloutput = sys.stdin.read()
    #print(fulloutput)
    full_parts = fulloutput.split('XCTAssertEqual failed: ')
    two_parts = full_parts[1]
    parts = two_parts.split(' is not equal to ')
    # print(parts)

    count = 0
    for part in parts:
        count += 1
        diffable = part.replace(',', '\n').replace(';', '\n').replace('(', '\n(').replace(')', ')\n').replace('[', '\n[\n').replace(']',']\n')
        # print(count)
        # print(diffable)
        if diffable[-1] != '\n':
            diffable += '\n'

        filename = split_file_path + str(count)
        with open(filename, 'w') as file:
            file.write(diffable)
    # run opendiff
    os.system("opendiff /tmp/xct_compare_split_1 /tmp/xct_compare_split_2 &2>/dev/null 1>/dev/null 3>/dev/null 0>/dev/null")
    #subprocess.run(["opendiff", "/tmp/xct_compare_split_1", "/tmp/xct_compare_split_2"])
    print(fulloutput)

if __name__ == "__main__":
    main()
