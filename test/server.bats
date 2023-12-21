setup_file() {
  load 'test_helper/common-setup'
  _common_setup

  PORT=$(./src/project.sh start-echo-server 2>&1 >/dev/null)
  export PORT
}

@test "server is reachable" {
  ncat -z localhost "$PORT"
}

teardown_file() {
  ./src/project.sh stop-echo-server
}
