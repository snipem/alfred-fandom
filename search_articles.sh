#!/bin/bash
# run: query="Assassins Creed" domain="https://assassinscreed.fandom.com/" ./search_articles.sh

if [[ -z "${domain}" ]]; then
    domain=$(cat "last_domain")
else
    echo -n "$domain" > "last_domain"
fi

icon_name=$(echo $domain | sed 's,https://,,g' | sed 's,/,,g')

icon_path="icons/$icon_name.ico"

if [ ! -e "$icon_path" ]
then
    ./download_favicon.sh "$domain" "$icon_path"
fi

http "$domain/api.php/?action=query&list=search&srsearch=$query&utf8=&format=json" |
    jq '{ "items" : [ .query.search[] | {
    uid: .pageid,
    title: .title,
    arg: ("'$domain'/" + .title),
    preview: ("'$domain'/" + .title),
    subtitle: .snippet,
    icon: {"path": ("'$icon_path'")}} ] }'
