#!/usr/bin/env python3

import re

# return str
def remove_punctuation(text: str):
    return re.sub(r'''[.,;\-']''', ' ', text)

# return str
def transform(word: str):
    chars = [char for char in word]
    size = len(chars)
    if size < 4:
        tmp = chars[0]
        chars[0] = chars[size - 1]
        chars[size - 1] = tmp
    else:
        tmp = chars[0]
        chars[0] = chars[1]
        chars[1] = tmp
        tmp = chars[size - 2]
        chars[size - 2] = chars[size - 1]
        chars[size - 1] = tmp
    return ''.join(chars)

text = input()
for word in remove_punctuation(text).lower().split():
    chars = [char for char in word]
    print(''.join(transform(chars)) + ' ', end='')
print()
