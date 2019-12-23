#!/bin/bash
# run: query="Assassins Creed" search_wikis.sh

http "https://community.fandom.com/api/v1/Wikis/ByString?string=$query&lang=en%2Cde&limit=25&expand=1&batch=1&includeDomain=true" |
jq \
'{ "items" : [ .items[] | select(.wam_score > 0) | {uid: .id, title: .name, arg: .domain, subtitle: (.topic + " " + .domain + " " + (.wam_score|tostring)) }] }'