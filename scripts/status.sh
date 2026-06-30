#!/usr/bin/env bash

set -e

check_port() {
  local name="$1"
  local host="$2"
  local port="$3"

  if nc -z "$host" "$port" 2>/dev/null; then
    echo "[UP]   $name on $host:$port"
  else
    echo "[DOWN] $name on $host:$port"
  fi
}

check_process() {
  local name="$1"
  local pattern="$2"

  if pgrep -f "$pattern" >/dev/null 2>&1; then
    echo "[UP]   process: $name"
  else
    echo "[DOWN] process: $name"
  fi
}

echo "Process status"
check_process "Spring Boot" "spring-boot:run"
check_process "Vite" "vite --host 127.0.0.1"
check_process "MySQL" "mysqld"

echo
echo "Port status"
check_port "Frontend" "127.0.0.1" "5173"
check_port "Backend" "127.0.0.1" "8080"
check_port "MySQL" "127.0.0.1" "3306"
