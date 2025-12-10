#!/usr/bin/env bash

# Configure to desired path
DEV_LOG="$HOME/dev-log.md"

TIMESTAMP=$(date "+%Y-%m-%d %H:%M")

echo "New dev log entry" >> "$DEV_LOG"
