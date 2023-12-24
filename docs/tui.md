tui
===

## `ish_tui_msg`

* use: `ish_tui_msg "${message severity}message text"`
* example:
    * call: `ish_tui_msg "${ISH_TUI_WARN}this is an example warning."`
    * result: "this is an example warning." is printed to the console in orange.
* idempotent: no (display only)
* note:
    * **requires a call to `ish_tui_msg_init` to set up message severity colors.**
    * supports the following severity levels:
        * `ISH_TUI_INFO` (white)
        * `ISH_TUI_WARN` (orange)
        * `ISH_TUI_ERROR` (red)

## `ish_tui_msg_init`

* use: `ish_tui_msg_init`
* example:
    * call: `ish_tui_msg_init`
    * result: sets `ISH_TUI_*` message severity color variables for the shell environment.
* idempotent: no (display only)

## `ish_tui_quiet`

* use: `ish_tui_quiet "command"`
* example:
    * call: `ish_tui_quiet "sudo apt install -y htop"`
    * result: runs command silently.
* idempotent: no (display only)
