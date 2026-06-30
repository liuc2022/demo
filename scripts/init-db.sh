#!/usr/bin/env bash

set -e

/opt/homebrew/opt/mysql@8.0/bin/mysql -h 127.0.0.1 -u root < "$(dirname "$0")/mysql/init.sql"
