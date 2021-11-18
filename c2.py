#!/usr/bin/env python3

import re

text = input()

text = re.sub(r'''(^| |'|-)(\w)(\w?)(\w)($| |-|,)''', r'\1\4\3\2\5', text)
# text = re.sub(r'''(^| |'|-)(\w)(\w)(\w*)(\w)(\w)($| |-|,)''', r'\1\3\2\4\6\5\7', text)

print(text)
