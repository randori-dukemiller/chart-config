#!/bin/bash
set -euf -o pipefail
cd "$(dirname "$0")"
cd ../../

if [[ -n ${CHANGED_FILES} ]]; then
  failed=false
  for f in ${CHANGED_FILES}; do
    if [[ $f == *.yaml ]]; then
      yamllint -d .github/scripts/yamllint.conf --format standard $f
      [[ $? -ne 0 ]] && failed=true;
    fi
  done
  [[ "$failed" == "true" ]] && exit 1
fi