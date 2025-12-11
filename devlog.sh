#!/usr/bin/env bash

# Configure to desired path
DEV_LOG="$HOME/dev-log.md"

TIMESTAMP=$(date "+%Y-%m-%d %H:%M")

 EDITOR_CMD="${EDITOR:-code}"

OPEN_EDITOR=true
CUSTOM_MESSAGE=""

for arg in "$@"; do
  case "$arg" in
    --no-open)
      OPEN_EDITOR=false
      ;;
    --help|-h)
      echo "Usage: devlog [--no-open]"
      exit 0
      ;;
    *)
      echo "Unknown option: $arg"
      exit 1
      ;;
  esac
done

{
  echo ""
  echo "## 🧠 Dev Log — $TIMESTAMP"
  echo "----------------------------------------"
  echo "New dev log entry" 
  echo ""
} >> "$DEV_LOG"

if [ "$OPEN_EDITOR" = true ]; then
  "$EDITOR_CMD" "$DEV_LOG"
fi
