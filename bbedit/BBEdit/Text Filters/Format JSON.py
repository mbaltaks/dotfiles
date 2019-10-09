#!/usr/bin/env python
# -*- coding: utf-8 -*-
from __future__ import unicode_literals
from __future__ import print_function
import sys
import json

def main():
    json_string = sys.stdin.read()
    json_data_structure = json.loads(json_string)
    formatted_json_string = json.dumps(json_data_structure, sort_keys=True, indent=4)
    print(formatted_json_string)

if __name__ == "__main__":
    main()
