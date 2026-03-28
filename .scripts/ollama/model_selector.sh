#!/usr/bin/env bash

set -eou pipefail

# Configuration
OLLAMA_API="http://localhost:11434/api/tags"

# Check if Ollama is running
if ! curl -s "$OLLAMA_API" > /dev/null 2>&1; then
    echo "❌ Error: Ollama server is not running or unreachable."
    exit 1
fi

# Extract model names from JSON (fixed with -f3)
MODELS=$(curl -s "$OLLAMA_API" | grep -oE '"name":"[^"]*"' | cut -d'"' -f4)

# If no models from API, fallback to ollama list
if [ -z "$MODELS" ]; then
    MODELS=$(ollama list | awk -F'"' '{print $4}' | sort -u | head -100)
fi

# Exit if no models found
if [ -z "$MODELS" ]; then
    echo "❌ No models found."
    echo "Download a model first: ollama pull qwen3.5:latest"
    exit 1
fi

# Show fzf menu with clean model names
echo "🚀 Select a model to run:"
SELECTED=$(echo "$MODELS" | fzf \
    --no-sort \
    --preview "ollama show {1}" \
    --preview-window right \
    )

# Run the model
echo "🎨 Running '$SELECTED'..."
ollama run "$SELECTED"
