# note: the functions being tested here are not intended for downstream use.

setup_file() {
  # other test failures may leave these lying around.
  rm -f /tmp/ish_*
}

setup() {
  load 'test_helper/common-setup'
  _common_setup

  source ./src/helpers.sh
}

@test "_is_on_path" {
  assert _is_on_path bash
  refute _is_on_path badbash
}

@test "_file_exists" {
  refute _file_exists /tmp/ish_file_exists
  touch /tmp/ish_file_exists
  assert _file_exists /tmp/ish_file_exists
}

@test "_symlink_exists" {
  refute _symlink_exists /tmp/ish_filesystem_symlink_test
  ln -s $PWD/fixtures/ish_filesystem_symlink_test /tmp/ish_filesystem_symlink_test
  assert _symlink_exists /tmp/ish_filesystem_symlink_test
}

teardown_file() {
  # other test failures may leave these lying around.
  rm -f /tmp/ish_*
}
