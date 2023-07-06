#! /usr/bin/env bats
setup() {
  cd "$(dirname "$BATS_TEST_FILENAME")/.." || exit
  . test/setup.sh
}

@test {% here %} {
  run sh -c ''
  assert_failure
}
