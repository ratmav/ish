setup() {
  load 'test_helper/common-setup'
  _common_setup

  source ./src/helpers.sh
  source ./src/filesystem.sh
}

@test "ish_symlink" {
  refute _symlink_exists /tmp/ish_symlink_test
  ish_symlink $PWD/fixtures /tmp ish_symlink_test
  assert _symlink_exists /tmp/ish_symlink_test
}

teardown_file() {
  rm -f /tmp/ish_symlink_test
}
