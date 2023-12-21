#!/usr/bin/env bash

source ./src/helper.sh

SERVER_PID=/tmp/project-echo-server.pid

if _is_first_run; then
  echo "Welcome to our project!"
fi

case $1 in
  start-echo-server)
    echo "Starting echo server"
    PORT=2000
    if _is_on_path ncat; then
      ncat -l $PORT -k -c 'xargs -n1 echo' 2>/dev/null &
      echo $! > $SERVER_PID
      echo "$PORT" >&2
    else
      echo "ncat not installed."
    fi
  ;;
  stop-echo-server)
    if _is_on_filesystem $SERVER_PID; then
      kill "$(< "$SERVER_PID")"
      rm $SERVER_PID
    fi
  ;;
  *)
    echo "NOT IMPLEMENTED!" >&2
    exit 1
  ;;
esac
