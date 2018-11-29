#!/bin/bash
GREEN="\033[32;1m"
YELLOW="\033[33;1m"
RESET="\033[0m"

filenames=""
for filename in `git diff --staged --name-only`
do
	filenames="spec/${filename:4} $filenames"
done

echo "${filename:-1}"

echo `exec rspec -c "${filename:-1}"`

# Need to review that
