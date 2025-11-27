#!/usr/bin/env bash
# ! NOTE: The script is NOT pure i.e, it generates different output
#           given you have not changed the html file thus you must run
#           the function only when needed and not via a cron job.

SCRIPT_DIR="$(dirname -- "${BASH_SOURCE[0]}")"
cd $SCRIPT_DIR

doc="https://docs.google.com/document/d/1cOuji7fDKKQBDMEI9oSPH62HddnO_TxY_58g_EfH1L0"

# Learn: [Date: 27 Nov 2025] - I'm not using below html export way because it produces `vocab.html` file of 86 mb, most probably because all images are inscribed in the html file. And in my opinion --- this is not related to any changes I made but the way google Docs has updated this export=html feature actually.
# file="vocab.html"
# wget --output-document=$file "$doc/export?format=html"

file="vocab.zip"
wget --output-document=$file "$doc/export?format=zip"
unzip $file -d html-zipped

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

# Go back to previous folder
cd -
