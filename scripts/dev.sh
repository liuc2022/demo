#!/usr/bin/env bash

set -e

ROOT_DIR="$(cd "$(dirname "$0")" && pwd)"
ACTION="${1:-}"

case "$ACTION" in
  init-db)
    "$ROOT_DIR/init-db.sh"
    ;;
  start-backend)
    "$ROOT_DIR/start-backend.sh"
    ;;
  start-frontend)
    "$ROOT_DIR/start-frontend.sh"
    ;;
  start)
    "$ROOT_DIR/start-all.sh"
    ;;
  restart)
    "$ROOT_DIR/stop-all.sh"
    "$ROOT_DIR/start-all.sh"
    ;;
  stop)
    "$ROOT_DIR/stop-all.sh"
    ;;
  status)
    "$ROOT_DIR/status.sh"
    ;;
  logs)
    TARGET="${2:-all}"
    case "$TARGET" in
      backend)
        tail -f "$ROOT_DIR/../.logs/backend.log"
        ;;
      frontend)
        tail -f "$ROOT_DIR/../.logs/frontend.log"
        ;;
      all)
        echo "Backend log: $ROOT_DIR/../.logs/backend.log"
        tail -n 50 "$ROOT_DIR/../.logs/backend.log" 2>/dev/null || true
        echo
        echo "Frontend log: $ROOT_DIR/../.logs/frontend.log"
        tail -n 50 "$ROOT_DIR/../.logs/frontend.log" 2>/dev/null || true
        ;;
      *)
        echo "Usage: ./scripts/dev.sh logs [backend|frontend|all]"
        exit 1
        ;;
    esac
    ;;
  *)
    cat <<'EOF'
Usage:
  ./scripts/dev.sh init-db
  ./scripts/dev.sh start-backend
  ./scripts/dev.sh start-frontend
  ./scripts/dev.sh start
  ./scripts/dev.sh restart
  ./scripts/dev.sh stop
  ./scripts/dev.sh status
  ./scripts/dev.sh logs [backend|frontend|all]
EOF
    exit 1
    ;;
esac
