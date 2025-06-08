#!/usr/bin/env bash
file="vocab.html"
wget --output-document=$file "https://docs.google.com/document/d/1cOuji7fDKKQBDMEI9oSPH62HddnO_TxY_58g_EfH1L0/export?format=html"

# Using prettier for readability of your code: (not necessary but if you use sed to update lines a space after : is added and we need to also specify the space in `sed` as well)
npm i -g prettier
prettier --write $file

# We add text before line </style> in a file vocab.html with sed (From vscode copilot)
#   * This for removing top and bottom padding of indentations in the order from left to right.
sed -i '' '/<\/style>/i\
.c3, .c6, .c8, .c27 .c2, .c24, .c51, .c99, .c90, .c12, .c1, .c16, .c56 {\
padding-top: 0px !important;\
padding-bottom: 0px !important;\
}\
' vocab.html
