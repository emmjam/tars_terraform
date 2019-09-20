#!/bin/bash

. /etc/init.d/common.sh

declare debug="${DEBUG:-0}";
declare -a args;

case "${debug}" in
  3)
    args+=("--debug");
    ;;
  2)
    args+=("-t");
    ;;
esac;

# pipefail means we get the rightmost non-zero return code from the timestamped output
set -o pipefail

DATECMD='date +%H:%M:%S'
terraform validate ${CODE_BASE} | {
# generate timestamped output
    while read line; do
      echo -e "$($DATECMD) $line"
    done
  };

readonly result="${?}";

if [ "${debug}" -ne 0 ]; then
  /bin/bash -l;
  exit "${result}";
else
  exit "${result}";
fi