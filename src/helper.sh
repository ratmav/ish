#!/usr/bin/env bash

_is_first_run() {
  local FIRST_RUN_FILE=/tmp/bats-tutorial-project-ran
  if [[ ! -e "$FIRST_RUN_FILE" ]]; then
    touch "$FIRST_RUN_FILE"
    return 0
  fi
  return 1
}

# check existence of file given file path.
_is_on_filesystem() {
  if [ -f "$1" ]; then
    return 0
  else
    return 1
  fi
}

# check path for executable by name.
_is_on_path() {
  if type "$1" > /dev/null 2>&1; then
    return 0
  else
    return 1
  fi
}
