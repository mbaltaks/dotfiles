#!/usr/bin/env python3
# -*- coding: utf-8 -*-
from __future__ import unicode_literals
from __future__ import print_function
import os
import sys
import json
import subprocess

def main():
    split_file_path = os.path.join('/tmp/', 'expect_compare_split_')
    fulloutput = sys.stdin.read()
    #print(fulloutput)
    #return
    #full_parts = fulloutput.split('Expectation failed: ')
    #two_parts = full_parts[1]
    parts = fulloutput.split(' == ')
    part1 = parts[0].split('→')[1]
    part2 = parts[1].split('→')[1]
    cleaned_parts = [part1, part2]
    # print(cleaned_parts)

    count = 0
    for part in cleaned_parts:
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
    os.system("opendiff /tmp/expect_compare_split_1 /tmp/expect_compare_split_2 &2>/dev/null 1>/dev/null 3>/dev/null 0>/dev/null")
    #subprocess.run(["opendiff", "/tmp/expect_compare_split_1", "/tmp/expect_compare_split_2"])
    print(fulloutput)

if __name__ == "__main__":
    main()
