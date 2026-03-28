#!/usr/bin/env bash
set -euo pipefail

# Configuration
OLLAMA_API="http://localhost:11434/api/tags"
SCRIPT_DIR="$HOME/.scripts/ollama"
# Autonomous model selection script
#MODEL_SELECTOR=$("$SCRIPT_DIR"/model_selector.sh)
DEFAULT_MODEL="$SCRIPT_DIR"/default.txt
MENU="$SCRIPT_DIR"/choices.txt
MENU_MANAGE="$SCRIPT_DIR"/manage_models.txt
MODELS_LIST=$(curl -s "$OLLAMA_API" | grep -oE '"name":"[^"]*"' | cut -d'"' -f4)

# Check if Ollama is running
check_ollama() {
    if ! curl -s "$OLLAMA_API" > /dev/null 2>&1; then
        echo "❌ Error: Ollama server is not running or unreachable."
        exit 1
    fi
}

# Option 1: Use the default model to chat
option_default_chat() {
  local QUICK=$(cat $DEFAULT_MODEL)
    if [ -z "${DEFAULT_MODEL:-}" ]; then
        echo "🤔 No default model is set. Please run option 3 to set one first."
        return
    fi
    
    echo "🎨 Running '$QUICK'..."
    ollama run "$QUICK"
}

# Option 2: Choose a model to use (Interactive Selection)
option_choose_model() {
    check_ollama
    
    # Check if model-selector.sh exists
    if [ ! -f "$MODEL_SELECTOR" ]; then
        echo "❌ Error: Model selector script not found at: $MODEL_SELECTOR"
        return 1
    fi
  bash $SCRIPT_DIR/model_selector.sh
}

# Option 3: Set the default model
option_set_default() {
    echo "📜 Set the default model for Quick Chat:"
    echo "📜 Available models:"
    
    # Show menu with FZF
    echo "Select a default Model : " 
    DEFAULT=$(echo "$MODELS_LIST" | fzf --height 25 --no-sort --preview "ollama show {1}" --preview-window bottom --ansi) 
                if [ -n "$DEFAULT" ]; then
                echo "✅ Default model set to: '$DEFAULT'"
                # Optional: Persist to file
                rm -f ${SCRIPT_DIR}/default.txt
                touch ${SCRIPT_DIR}/default.txt
                echo "$DEFAULT" >> $SCRIPT_DIR/default.txt 2>/dev/null || true
                echo "📝 Default model saved to ./default.txt (if writable)"
            fi
      
}

# Option 4: Manage models (Pull/RM/Show/Start/Stop)
option_manage_models() {
    check_ollama

    local choice=$(cat $MENU_MANAGE | fzf --reverse --with-nth='2..' --accept-nth 1 --prompt "🛠️ Manage Models :")
    case "$choice" in
        1)
            echo "📥 Pull a model:"
                read -r model
                if [ -n "$model" ]; then
                    ollama pull "$model"
                    echo "✅ '$model' pulled."
                fi
            
            ;;
        2)
            echo "🗑️ Remove a model:"
            ollama list 2>/dev/null | awk 'NR > 1 {print $1}' | fzf --height 25 --prompt "Select model to remove: " | {
                read -r model
                if [ -n "$model" ]; then
                    ollama rm "$model"
                    echo "✅ '$model' removed."
                fi
            }
            ;;
        3)
            echo "⏸️ Stop a running model:"
            ollama ps 2>/dev/null | awk 'NR > 1 {print $1}' | fzf --height 25 \
                --prompt "Select model to stop: " | {
                read -r model
                if [ -n "$model" ]; then
                    ollama stop "$model"
                    echo "✅ '$model' stopped."
                fi
            }
            ;;
        4)
            echo "📜 All Models:"
            ollama list
            ;;
        
        5)
          show_menu
            ;;
        *)
            echo "❌ Invalid choice. Run again."
            ;;
    esac
}

# Main menu
show_menu() {
    
  local choice=$(cat $MENU | fzf --reverse --with-nth='2..' --accept-nth 1 --prompt "🎮 Ollama Menu Manager")
    
    case $choice in
        1) option_default_chat;;
        2) option_choose_model;;
        3) option_set_default;;
        4) option_manage_models;;
        5|*) echo "👋 Goodbye!"; exit 0;;
    esac
}

show_menu

