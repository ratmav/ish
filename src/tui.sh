#!/usr/bin/env bash

ish_tui_msg() {
  # ISH_TUI_CLEAR restores colors.
  echo >&2 -e "${1-}${ISH_TUI_CLEAR}"
}

ish_tui_msg_init() {
  if [[ -t 2 ]] && [[ -z "${NO_COLOR-}" ]] && [[ "${TERM-}" != "dumb" ]]; then
    # error: read; clear: restore colors, info: white, warn: orange.
    # shellcheck disable=SC2034
    ISH_TUI_ERROR='\033[0;31m' ISH_TUI_CLEAR='\033[0m' ISH_TUI_INFO='\033[0;32m' ISH_TUI_WARN='\033[0;33m'
  else
    # shellcheck disable=SC2034
    ISH_TUI_ERROR='' ISH_TUI_CLEAR='' ISH_TUI_INFO='' ISH_TUI_WARN=''
  fi
}

ish_tui_quiet() {
  $1 > /dev/null
}
