#!/usr/bin/env bash
set -euo pipefail

# Configuration
OLLAMA_API="http://localhost:11434/api/tags"
SCRIPT_DIR="$HOME/.scripts/ollama"
DEFAULT_MODEL="$SCRIPT_DIR/default.txt"
MENU=("1 1) Quickchat" "2 2) Choose a model to use" "3 3) Set the default model" "4 4) Manage Models" "5 5) Quit")
MENU_MANAGE=("1 1) Pull a model" "2 2) Remove a model" "3 3) Stop a running model" "4 4) List all models" "5 5) Return")
#MODELS_LIST=$(curl -s "$OLLAMA_API" | grep -oE '"name":"[^"]*"' | cut -d'"' -f4) #Alternative way to grep model list, plan to implement it as the main way with ollama list as a fallback.

# Check if Ollama is running
check_ollama() {
    if ! curl -s "$OLLAMA_API" > /dev/null 2>&1; then
        echo "❌ Error: Ollama server is not running or unreachable."
        exit 1
    fi
}

# Main menu
show_menu() {
    check_ollama
    local choice
    choice=$(printf "%s\n" "${MENU[@]}" | fzf --reverse --with-nth='2..' --accept-nth 1 --prompt "🎮 Ollama Menu Manager")
    
    case "$choice" in
        1) option_quick_chat;;
        2) option_choose_model;;
        3) option_set_default;;
        4) option_manage_models;;
        5) echo "👋 Goodbye!"; exit 0;;
        *) echo "👋 Goodbye!"; exit 0;;
    esac
}

# Option 1: Use the default model to chat
option_quick_chat() {
    local QUICK
    QUICK=$(<"$DEFAULT_MODEL")
    if [ -z "$QUICK" ]; then
        echo "🤔 No default model is set. Please run option 3 to set one first."
        return
    fi
    ollama run "$QUICK"
}

# Option 2: Choose a model to use (Interactive Selection)
option_choose_model() {    
    local model
    model=$(ollama list 2>/dev/null | awk 'NR > 1 {print $1}' | fzf --height 25 --prompt "Select a Model to use :" --accept-nth 1 --no-sort --preview "ollama show {1}" --preview-window right)
    if [ -n "$model" ]; then
        echo "🎨 Running '$model'..."
        ollama run "$model"
    else
        echo "❌ No model found, please pull a model and try again."
    fi
}

# Option 3: Set the default model
option_set_default() {
      # Show menu with FZF
    local DEFAULT
    DEFAULT=$(ollama list 2>/dev/null | awk 'NR > 1 {print $1}' | fzf --height 25 --prompt "Select a Default Model :" --accept-nth 1 --no-sort --preview "ollama show {1}" --preview-window right) 
    if [ -n "$DEFAULT" ]; then
        echo "$DEFAULT" > "$SCRIPT_DIR/default.txt"
        echo "✅ Default model set to: '$DEFAULT'"
    fi
}

# Option 4: Manage models (Pull/RM/Show/Start/Stop)
option_manage_models() {
    
    local choice
    choice=$(printf "%s\n" "${MENU_MANAGE[@]}" | fzf --reverse --with-nth='2..' --accept-nth 1 --prompt "🛠️ Manage Models :")
    case "$choice" in
        1)
            echo "📥 Pull a model:"
            read -r model
            if [ -n "$model" ]; then
                if ollama list 2>/dev/null | grep -q "^${model}$"; then
                    echo "✅ Model '$model' is already installed."
                else
                    ollama pull "$model"
                    echo "✅ '$model' pulled."
                fi
            else
                echo "❌ No model name provided."
            fi
            ;;
        2)
            local model
            model=$(ollama list 2>/dev/null | awk 'NR > 1 {print $1}' | fzf --height 25 --prompt "Select model to remove: ")
            if [ -n "$model" ]; then
                ollama rm "$model"
                    echo "✅ '$model' removed."
            else
                echo "❌ No model name provided."
            fi
            ;;
        3)
            local model
            model=$(ollama ps 2>/dev/null | awk 'NR > 1 {print $1}' | fzf --height 25 --prompt "Select model to stop: ")
            if [ -n "$model" ]; then
                ollama stop "$model"
                if ! ollama ps 2>/dev/null | grep -q "^${model}$"; then
                    echo "✅ '$model' stopped."
                else
                    echo "❌ Failed to stop '$model'"
                fi
            else
                echo "❌ No model running."
            fi
            ;;
        4)
            ollama list 2>/dev/null | awk 'NR > 1 {print $1}' | fzf --height 25 --prompt "Installed Models: " --accept-nth 1 --no-sort --preview "ollama show {1}" --preview-window right
            show_menu
            ;;
        5)
            show_menu
            ;;
        *)
            echo "❌ How did you end up here ??? Invalid choice, run again."
            ;;
    esac
}

case "${1:-}" in
        -q) option_quick_chat;;
        -m) option_manage_models;;
        *) show_menu;;
esac     
