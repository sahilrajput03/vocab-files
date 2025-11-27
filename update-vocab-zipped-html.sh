#!/usr/bin/env bash
# ! NOTE: The script is NOT pure i.e, it generates different output
#           given you have not changed the html file thus you must run
#           the function only when needed and not via a cron job.

SCRIPT_DIR="$(dirname -- "${BASH_SOURCE[0]}")"
cd $SCRIPT_DIR

doc="https://docs.google.com/document/d/1cOuji7fDKKQBDMEI9oSPH62HddnO_TxY_58g_EfH1L0"


file="vocab.zip"
wget --output-document=$file "$doc/export?format=zip"
output_folder=html-zipped
rm -rf $output_folder
mkdir -p $output_folder
unzip $file -d $output_folder

# ! DISABLING PRETTIER AND FORMATTING FOR SOME WEEKS FOR NOW.

# Using prettier for readability of your code: (not necessary but if you use sed to update lines a space after : is added and we need to also specify the space in `sed` as well)
# output_html_file="$output_folder/SahilsVocabulary.html"
# npm i -g prettier
# prettier --write $output_html_file

# We add text before line </style> in a file vocab.html with sed (From vscode copilot)
#   * This for removing top and bottom padding of indentations in the order from left to right.
# sed -i '' '/<\/style>/i\
# .c3, .c6, .c8, .c27 .c2, .c24, .c51, .c99, .c90, .c12, .c1, .c16, .c56 {\
# padding-top: 0px !important;\
# padding-bottom: 0px !important;\
# }\
# ' $output_html_file

# Go back to previous folder
cd -
