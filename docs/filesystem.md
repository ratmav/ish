filesystem
==========

## `ish_filesystem_symlink`

* use: `ish_filesystem_symlink source_dir target_dir file_name`
* example:
    * call: `ish_filesystem_symlink $PWD /tmp README.md`
    * result: the file at `$PWD/README.md` will be symlinked to `/tmp/README.md`
* idempotent: yes
