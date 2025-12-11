#!/usr/bin/env bash

APP_NAME="chronicle"
DEV_LOG="$HOME/dev-log.md"

TIMESTAMP=$(date "+%Y-%m-%d %H:%M")

EDITOR_CMD="${EDITOR:-code}"
if ! command -v "$EDITOR_CMD" >/dev/null 2>&1; then
  EDITOR_CMD="nano"
fi

OPEN_EDITOR=true
CUSTOM_MESSAGE=""


for arg in "$@"; do
  case "$arg" in

    --no-open)
      OPEN_EDITOR=false
      ;;

    --message=* | -m=*)
      CUSTOM_MESSAGE="${arg#*=}"      
      ;;

    install)
      echo "Installing CHRONICLE..."
      mkdir -p "$HOME/.local/bin"

      cp "$0" "$HOME/.local/bin/$APP_NAME"
      chmod +x "$HOME/.local/bin/$APP_NAME"

      echo "✨ Installed at: ~/.local/bin/$APP_NAME"
      echo "👉 Make sure ~/.local/bin is in your PATH:"
      echo "export PATH=\"\$HOME/.local/bin:\$PATH\""
      exit 0
      ;;

    --help | -h)
      echo "CHRONICLE — Developer Journal CLI"
      echo ""
      echo "Usage: chronicle [options]"
      echo ""
      echo "Options:"
      echo "  install           Install chronicle to ~/.local/bin"
      echo "  --message=TEXT    Write custom entry text"
      echo "  --no-open         Do not open the dev log"
      echo "  -h, --help        Show this help"
      exit 0
      ;;

    --last=*)
      LIST_ENTRIES="${arg#*=}"
      LIST_ENTRIES=$((LIST_ENTRIES))  # ensure it's an integer
      ;;
    --list)
      LIST_ENTRIES=5
      ;;

    *)
      echo "Unknown option: $arg"
      echo "Run 'chronicle --help'"
      exit 1
      ;;
  esac
done

# Ensure dev log file exists
if [ ! -f "$DEV_LOG" ]; then
  touch "$DEV_LOG"
  echo "# Developer Log" >> "$DEV_LOG"
  echo "Created new dev log at $DEV_LOG"
fi


{
  echo ""
  echo "## 🧠 Dev Log — $TIMESTAMP"
  echo "----------------------------------------"
  if [ -n "$CUSTOM_MESSAGE" ]; then
    echo "$CUSTOM_MESSAGE"
  else
    echo "New dev log entry"
  fi
  echo ""
} >> "$DEV_LOG"

if [ "$OPEN_EDITOR" = true ]; then
  "$EDITOR_CMD" "$DEV_LOG"
fi
