#!/usr/bin/env bash

for file in *; do
  var=${file^^}
  if [ -d "$file" ] && [ ! -z "${!var}" ]; then
    repo=${!var}
    git clone --recursive ${repo} ${file}
    cd ${file}
    git clean -f -d
    git reset --hard
    git pull
    cd ..
  fi
done

npm start   
