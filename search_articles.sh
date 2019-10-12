#!/bin/bash

if [[ -z "${domain}" ]]; then
    domain=$(cat "$alfred_workflow_cache/last_domain")
else
    mkdir -p "$alfred_workflow_cache"
    echo -n "$domain" > "$alfred_workflow_cache/last_domain"
fi

http "https://$domain/api/v1/Search/List?query=$query&limit=25&minArticleQuality=10&batch=1&namespaces=0%2C14" | 
jq \
'{ "items" : [ .items[] | {uid: .id, title: .title, arg: .url, subtitle: .snippet}] }'