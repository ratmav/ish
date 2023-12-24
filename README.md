ish
===

(i)dempotent (sh)ell

```
                            .:
                            :.
                         :oo::.
           ..       ...:oOOOoo: ....           :
           oOOo::o::ooOOOOOoOO. .: .o::...:...::
           .:oo: :..:O8O:.  Oo   .  oOOOOOOOOOO:
          .oo8o. ....::Oo.  O8:     o8O8888O....
         .oOO8O.  ..::.:O:  :O:     :OOoo:.  .:O.
        .ooooo.    :OO: .:  :::::  .ooo:    o::..:
     .oooo:oo:.     .::::oOooOOOO:.:o.    .O8.   o:
   .:o:...    .   :::::oOOOOoooOOOOo::  .oo::   :Ooo:
  :O8O.      .o:.:oOOOoooo::o:::OOO:.oo:OOo    ::OOOOOo.
   .ooo::     .oOo:oOOoo::ooo: .:o::..ooo.     . .:OOO8OOo..
   .oO88O:o:  ooo::oo:ooo:::...:::..::::::        ..:ooo::
   .:O88OOOO:oOoOOoo:oo:oooo:.. .:..:oOOo.:..:.    ......
   .:oo:.   .:Oo:oooooooOOOOO:.  :o::ooo.:ooOO.  ..:..:o.
   .:.....:oo:OO:ooooo:oOOOOoo.   o. :o:.oo.:. .:  :o.oo
   :Oooo:oo:  :O:oOo:::::ooo:.   .o.  :oo:O:   .:..ooOOo
   :8Oo:...  ..o:oo::::.....     o:..:oOO:...:.:::ooOOOo
     :OOoo:...:o::::.:o:.     ..::.:::o::  .:.::::..o8Oo.
       :oooo..:o:.:::::o:..........:o:...::..oOo::o::O8O:..
         .oo...OO:. ...:.    .. .:oOo:.  :o: .o::::. .oo..::
           .:.:O8:..:..::..   ...::oOo.   ::.... .:.....
             .ooOo:oo:.:o::::..               oOo::.:o.
                ...... .:ooOo.              . .O8OOOO:
                          .o:                 .o:.o:.
                                               .oo:
                                                 ..
```

## dependencies

* [bash](https://www.gnu.org/software/bash/manual/bash.html)

## use

ish is meant to be used from other projects as a [git submodule](https://git-scm.com/book/en/v2/Git-Tools-Submodules). to include ish in a project:

```shell
$ git submodule add https://github.com/ratmav/ish.git ish
```

moving foward, assume the following project structure:

```shell
.
├── ish
│   ├── bin
│   │   ├── scaffold
│   │   └── ...
│   ├── src
│   │   ├── filesystem.sh
│   │   └── ...
│   └── ...
├── project.sh
└── README.md
```

### as a library

`project.sh` sources ish's filesystem script and calls `ish_filesystem_symlink` to idempotently symlink the project readme to a location in /tmp:

```bash
#!/usr/bin/env bash

source ish/src/filesystem.sh

ish_filesystem_symlink $PWD /tmp README.md
```

### as a tool

with the above project structure in mind, ish provides the following [binstubs](https://github.com/rbenv/rbenv/wiki/Understanding-binstubs) to automate common tasks.

#### `scaffold`

```shell
./ish/bin/scaffold --help
Usage: scaffold [--cli] [--help]

Available flags (choose one):

--cli  generate a cli application template in ./cli.sh
--help Print this help and exit.
```

for each scaffold, see the corresponding template file in the `./templates/` directory.

## develop

* clone: `git clone --recurse-submodules https://github.com/ratmav/ish`
* test w/ [bats](https://github.com/bats-core/bats-core): `cd ish && ./bin/test`
* lint w/ [shellcheck](https://github.com/koalaman/shellcheck): `cd ish && ./bin/lint`

## faq

### what makes ish useful?

in the example from the above section on using ish as a library, the symlink may already exist, be broken, etc. `ish_filesystem_symlink` will create _or recreate_ the symlink, meaning we can call `ish_filesytem_symlink` for [idempotent](https://en.wikipedia.org/wiki/Idempotence) shell operations. in other words, we can call `ish_filesystem_symlink` multiple times and get the same result.

### are **all** ish operations idempotent?

idempotency is a best-effort goal of the project, but there may be times when it's not practical or useful. when in doubt, take a look at the `docs` directory. better yet, read the source.

### why bash?

live off the land.

#### why not [ansible](https://www.ansible.com/), etc.?

other tools are meant to do more specific tasks, such as configuration management, and as such provide dsl's that are typically yaml based. when the task at hand becomes more complex than the dsl was designed to handle, it's often necessary to call out to other tools, usually bash. configuration management tools also tend to require things like a python interpreter or some agent installation on the target system.

ish is meant to have minimal dependencies, be available for use as a library, and provide some convenience tooling for common tasks. it may make sense to use ish to provision systems for use by other tools (such as installing a configuration management agent), or it may make sense to simply use ish as a generic toolbox of common utilities.
