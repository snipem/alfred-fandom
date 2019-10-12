#!/bin/bash

http "https://community.fandom.com/api/v1/Wikis/ByString?string=$query&lang=en%2Cde&limit=25&expand=1&batch=1&includeDomain=true" |
jq \
'{ "items" : [ .items[] | {uid: .id, title: .name, arg: .domain, subtitle: (.topic + " " + (.wam_score|tostring)) }] }'