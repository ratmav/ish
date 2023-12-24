#!/usr/bin/env bash

# check existence of file given file path.
_file_exists() {
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

# check existence and functionality of symbolic link.
_symlink_exists() {
  if [ -L $1 ] && [ -e $1 ]; then
    return 0
  else
    return 1
  fi
}
