#!/usr/bin/env bash

# ish_symlink source_dir target_dir file_name
ish_symlink() {
  rm -rf "$2"/"$3"
  ln -s "$1"/"$3" "$2"/"$3"
}
