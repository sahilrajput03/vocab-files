#!/usr/bin/env bash
$file="vocab.html"
wget --output-document=$file "https://docs.google.com/document/d/1cOuji7fDKKQBDMEI9oSPH62HddnO_TxY_58g_EfH1L0/export?format=html"

# Using prettier for readability of your code: (not necessary but if you use sed to update lines a space after : is added and we need to also specify the space in `sed` as well)
npm i -g prettier
prettier --write $file

# To remove - "max-width: 468pt;"
# sed -i '' 's/max-width: 468pt;//g' "$file"

# To replace - "padding: 72pt 72pt 72pt 72pt;" with "padding: 0% 5%;"
# sed -i '' 's/padding: 72pt 72pt 72pt 72pt;/padding: 0% 5%;/g' "$file"
