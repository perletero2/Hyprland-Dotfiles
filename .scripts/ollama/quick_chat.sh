#!/usr/bin/env bash
set -euo pipefail

# Configuration
OLLAMA_API="http://localhost:11434/api/tags"
SCRIPT_DIR="$HOME/.scripts/ollama"
DEFAULT_MODEL="$SCRIPT_DIR"/default.txt

check_ollama() {
    if ! curl -s "$OLLAMA_API" > /dev/null 2>&1; then
        echo "❌ Error: Ollama server is not running or unreachable."
        exit 1
    fi
}

default_chat() {
  local QUICK=$(cat $DEFAULT_MODEL)
    if [ -z "${DEFAULT_MODEL:-}" ]; then
        echo "🤔 No default model is set. Please run Ollama Manager to set one first."
        return
    fi
    
    echo "🎨 Running '$QUICK'..."
    ollama run "$QUICK"
}

check_ollama
default_chat
