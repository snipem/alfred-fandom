#!/bin/bash

if [[ -z "${domain}" ]]; then
    domain=$(cat "last_domain")
else
    echo -n "$domain" > "last_domain"
fi

icon_path="icons/$domain.ico"

if [ ! -e "$icon_path" ]
then
    ./download_favicon.sh "$domain" "$icon_path"
fi

http "https://$domain/api/v1/Search/List?query=$query&limit=25&minArticleQuality=10&batch=1&namespaces=0%2C14" | 
jq \
'{ "items" : [ .items[] | { uid: .id, title: .title, arg: .url, subtitle: .snippet, icon: {"path": ("'$icon_path'")}} ] }'