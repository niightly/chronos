#!/bin/bash
YELLOW="\033[33;1m"
RESET="\033[0m"
set -e

echo -e "\n${YELLOW}### Step 1 - Checking best practices (linters) ${RESET}"
bundle exec rubocop
bundle exec haml-lint app/views

echo -e "\n${YELLOW}### Step 2 - Auditing the code (vulnerabilities) ${RESET}"
bundle exec bundle-audit --update
bundle exec brakeman

echo -e "\n${YELLOW}### Step 3 - Testing ${RESET}"
bundle exec rspec
open coverage/index.html
