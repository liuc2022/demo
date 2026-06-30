#!/usr/bin/env bash

set -e

ROOT_DIR="$(cd "$(dirname "$0")/.." && pwd)"
LOG_DIR="$ROOT_DIR/.logs"

mkdir -p "$LOG_DIR"

export SPRING_PROFILES_ACTIVE="${SPRING_PROFILES_ACTIVE:-local}"
export DB_HOST="${DB_HOST:-127.0.0.1}"
export DB_PORT="${DB_PORT:-3306}"
export DB_NAME="${DB_NAME:-cmb_demo}"
export DB_USERNAME="${DB_USERNAME:-root}"
export DB_PASSWORD="${DB_PASSWORD:-}"
export VITE_API_BASE_URL="${VITE_API_BASE_URL:-http://127.0.0.1:8080}"

echo "Starting mysql@8.0..."
brew services start mysql@8.0 >/dev/null

echo "Initializing database..."
"$ROOT_DIR/scripts/init-db.sh"

echo "Starting backend..."
(
  cd "$ROOT_DIR/backend"
  export JAVA_HOME=/Library/Java/JavaVirtualMachines/zulu-8.jdk/Contents/Home
  "$ROOT_DIR/.tmp/apache-maven-3.6.3/bin/mvn" \
    -s "$ROOT_DIR/backend/.mvn/settings.xml" \
    -Dmaven.repo.local="$ROOT_DIR/.m2/repository" \
    spring-boot:run
) >"$LOG_DIR/backend.log" 2>&1 &

echo "Starting frontend..."
(
  cd "$ROOT_DIR/frontend"
  export PATH=/Users/liuchao/.nvm/versions/node/v22.19.0/bin:$PATH
  npm run dev -- --host 127.0.0.1
) >"$LOG_DIR/frontend.log" 2>&1 &

echo "Services are starting."
echo "Frontend: http://127.0.0.1:5173"
echo "Backend:  http://127.0.0.1:8080"
echo "Logs:     $LOG_DIR"

wait
