SHELL := /bin/bash

test:

watch:
	ls search_wikis.sh search_articles.sh download_favicon.sh | entr cp -av search_articles.sh search_wikis.sh download_favicon.sh ${HOME}/cloud/data/alfred/Alfred.alfredpreferences/workflows/user.workflow.B5AC26E5-B9B4-4EE2-AD72-46011385A3F4/

test:
	bats tests/*
