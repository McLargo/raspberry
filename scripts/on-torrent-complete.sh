#!/bin/bash

# This script is intended to be called by Transmission when a torrent completes.

# Use cases could be:
# - move the completed torrent to a different location
# - send a notification
# - execute complex logic in another language like Python.

PYTHON_BIN="/usr/bin/python3"
SCRIPT_PATH="/path/to/your/script.py"

# bypass any logic in the .sh and directly call the .py with the necessary arguments
$PYTHON_BIN "$SCRIPT_PATH" "$TR_TORRENT_DIR" "$TR_TORRENT_NAME" "$TR_TORRENT_ID"
