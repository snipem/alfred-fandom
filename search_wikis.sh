#!/bin/bash
# run: lang=en query="Dragon's Dogma" search_wikis.sh

if [[ -z "${lang}" ]]; then
    lang="en"
fi

/usr/local/bin/http --follow "https://community.fandom.com/wiki/Special:SearchCommunity?query=$query&resultsLang=$lang" |
    /usr/local/bin/pup ".unified-search__result__community__thumbnail > a json{}" |
    /usr/local/bin/jq '{ "items" : [ .[] | {uid: .href, title: .children[0].alt, arg: .href, subtitle: .href }] }'

