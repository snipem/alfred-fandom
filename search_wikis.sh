#!/bin/bash
# run: lang=en query="Dragon's Dogma" search_wikis.sh

if [[ -z "${lang}" ]]; then
    lang="en"
fi

http "https://community.fandom.com/api/v1/Wikis/ByString?string=$query&lang=$lang%2Cde&limit=25&expand=1&batch=1&includeDomain=true" |
jq \
'{ "items" : [ .items[] | select(.wam_score > 0) | {uid: .id, title: .name, arg: .domain, subtitle: (.topic + " " + .domain + " " + .language + " " + (.wam_score|tostring)) }] }'