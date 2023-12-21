setup() {
  load 'test_helper/common-setup'
  _common_setup
}

@test "executable script" {
  run ./src/project.sh
}

@test "welcome message only on first invocation" {
  # this file shouldn't be present during test runs,
  # but this code is left to demo bats skip.
  if [[ -e /tmp/bats-tutorial-project-ran ]]; then
    skip 'The FIRST_RUN_FILE already exists'
  fi

  run ./src/project.sh
  assert_output --partial 'Welcome to our project!'

  run ./src/project.sh
  refute_output --partial 'Welcome to our project!'
}

teardown() {
  rm -f /tmp/bats-tutorial-project-ran
}
