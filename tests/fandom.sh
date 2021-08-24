#!/usr/bin/env bats
# run: make

setup () {
    # Load utils for better testing
    load '/usr/local/lib/bats-support/load.bash'
    load '/usr/local/lib/bats-assert/load.bash'
}

@test "search_wikis" {
  query="Assassins Creed" run bash search_wikis.sh
  assert_success
  assert_output --partial 'Assassins'
}

@test "search_article" {
  rm last_domain || true
  export domain="assassinscreed.fandom.com"
  query="Bayek"  run bash search_articles.sh
  echo $output
  assert_success
  assert [ -e 'last_domain' ]
  assert [ -e "icons/$domain.ico" ]
  assert_output --partial 'Bayek'
}


@test "favicon" {

	rm testfile.ico || true
    bash download_favicon.sh the-messenger.fandom.com testfile.ico
    assert [ -e 'testfile.ico' ]

}
