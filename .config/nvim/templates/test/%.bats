#! /usr/bin/env bats
setup() {
  cd "$(dirname "$BATS_TEST_FILENAME")/.." || exit 1
  . test/setup.sh
}

@test {% here %} {
  run sh -c ''
  assert_failure
}
