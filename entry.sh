#!/bin/bash

set -e

echo $*

if [ -n "$PROJECT_SRC" ]; then
  pushd $PROJECT_SRC
fi

if [ "$#" -ge 1 ]; then
    p=$1
    shift
    exec $p "$@"
fi
exec bash "$@"
