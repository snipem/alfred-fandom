#!/bin/bash
# run: ./download_favicon.sh the-messenger.fandom.com testfile.ico
# test: rm testfile.ico; ./download_favicon.sh the-messenger.fandom.com testfile.ico && rm testfile.ico && echo "✅"

favicon_url=$(curl -L -s https://"$1" | grep 'rel="shortcut icon"' | sed -n 's/.*href="\([^"]*\).*/\1/p')
curl --silent "$favicon_url" -o "$2"