#!/usr/bin/env bash

# Configure to desired path
DEV_LOG="$HOME/dev-log.md"

TIMESTAMP=$(date "+%Y-%m-%d %H:%M")

{
  echo ""
  echo "## 🧠 Dev Log — $TIMESTAMP"
  echo "----------------------------------------"
  echo "New dev log entry" 
  echo ""
} >> "$DEV_LOG"
