#!/usr/bin/env bash

ish_filesystem_symlink() {
  rm -rf "${2:?}g"/"$3"
  ln -s "$1"/"$3" "$2"/"$3"
}
