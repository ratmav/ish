setup_file() {
  # other test failures may leave these lying around.
  rm -f /tmp/bats-tutorial-project-ran
  rm -f /tmp/ish-is-on-filesystem
}

setup() {
  load 'test_helper/common-setup'
  _common_setup

  source ./src/helper.sh
}

@test "_is_first_run" {
  assert _is_first_run
  refute _is_first_run
  refute _is_first_run
}

@test "_is_on_path" {
  assert _is_on_path bash
  refute _is_on_path badbash
}

@test "_is_on_filesystem" {
  refute _is_on_filesytem /tmp/ish-is-on-filesystem

  touch /tmp/ish-is-on-filesystem
  assert _is_on_filesystem /tmp/ish-is-on-filesystem
}

teardown_file() {
  # other test failures may leave these lying around.
  rm -f /tmp/bats-tutorial-project-ran
  rm -f /tmp/ish-is-on-filesystem
}
