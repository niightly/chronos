#!/bin/bash
YELLOW="\033[33;1m"
set -e

echo -e "\n${YELLOW}### Running linters";
bundle exec rubocop
bundle exec haml-lint app/views

echo -e "\n${YELLOW}### Running code audits";
bundle exec bundle-audit --update
bundle exec brakeman
sudo mkdir -p coverage
sudo chown -R travis:travis coverage

echo -e "\n${YELLOW}### Running tests";
bundle exec rspec --tag ~external
