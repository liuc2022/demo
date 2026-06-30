#!/usr/bin/env bash

set -e

echo "Stopping Vite dev server..."
pkill -f "vite --host 127.0.0.1" || true

echo "Stopping Spring Boot app..."
pkill -f "spring-boot:run" || true

echo "Stopping mysql@8.0..."
brew services stop mysql@8.0 >/dev/null || true

echo "All stop commands issued."
