#!/usr/bin/env bash

set -e

export PATH=/Users/liuchao/.nvm/versions/node/v22.19.0/bin:$PATH
export VITE_API_BASE_URL="${VITE_API_BASE_URL:-http://127.0.0.1:8080}"

cd "$(dirname "$0")/../frontend"
npm run dev -- --host 127.0.0.1
