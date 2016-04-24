#!/usr/bin/env bash

cd $1
git clean -f -d
git reset --hard
git pull

