#!/usr/bin/env python
# -*- coding: utf-8 -*-
from __future__ import unicode_literals
from __future__ import print_function
import os
import sys
import gzip
import json
import base64

def main():
    string = sys.stdin.read()
    filename = os.path.join('/tmp/', 'gzipped')
    with gzip.open(filename, 'wt') as f:
    		f.write(string)
    with open(filename, 'rb') as file:
    		gzip_data = file.read()
    		base64_data = base64.b64encode(gzip_data)
    		print(base64_data)

if __name__ == "__main__":
    main()
