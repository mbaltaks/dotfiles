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
    base64_string = sys.stdin.read()
    data = base64.b64decode(base64_string)
    filename = os.path.join('/tmp/', 'base64decoded')
    with open(filename, 'w') as file:
            file.write(data)
    with gzip.open(filename, 'rb') as f:
        json_string = f.read()
        try:
            json_data_structure = json.loads(json_string)
            formatted_json_string = json.dumps(json_data_structure, sort_keys=True, indent=4)
            print(formatted_json_string)
        except:
            print(json_string)

if __name__ == "__main__":
    main()
