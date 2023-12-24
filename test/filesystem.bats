setup_file() {
  # other test failures may leave these lying around.
  rm -f /tmp/ish_*
}

setup() {
  load 'test_helper/common-setup'
  _common_setup

  source ./src/helpers.sh
  source ./src/filesystem.sh
}

@test "ish_filesystem_symlink" {
  refute _symlink_exists /tmp/ish_filesystem_symlink_test
  ish_filesystem_symlink $PWD/fixtures /tmp ish_filesystem_symlink_test
  assert _symlink_exists /tmp/ish_filesystem_symlink_test
}

teardown_file() {
  rm -f /tmp/ish_*
}
