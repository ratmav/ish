# NOTE: this file exists **specifically** to check for project
#       dependencies, i.e. binaries that are required for the
#       project to run. ideally, there are as few of these as
#       possible.

setup() {
  load 'test_helper/common-setup'
  _common_setup

  source ./src/helper.sh
}

@test "ncat is on path" {
  assert _is_on_path ncat
}
