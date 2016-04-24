#!/usr/bin/env bash

for file in *; do
  var=${file^^}
  if [ -d "$file" ] && [ ! -z "${!var}" ]; then
    repo=${!var}
    git clone --recursive ${repo}
  fi
done
   
