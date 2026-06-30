#!/usr/bin/env bash

set -e

export JAVA_HOME=/Library/Java/JavaVirtualMachines/zulu-8.jdk/Contents/Home
export SPRING_PROFILES_ACTIVE="${SPRING_PROFILES_ACTIVE:-local}"
export DB_HOST="${DB_HOST:-127.0.0.1}"
export DB_PORT="${DB_PORT:-3306}"
export DB_NAME="${DB_NAME:-cmb_demo}"
export DB_USERNAME="${DB_USERNAME:-root}"
export DB_PASSWORD="${DB_PASSWORD:-}"

cd "$(dirname "$0")/../backend"
"$(cd "$(dirname "$0")/.." && pwd)/.tmp/apache-maven-3.6.3/bin/mvn" \
  -s .mvn/settings.xml \
  -Dmaven.repo.local="$(cd "$(dirname "$0")/.." && pwd)/.m2/repository" \
  spring-boot:run
