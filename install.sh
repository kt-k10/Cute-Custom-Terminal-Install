#!/bin/bash

# Cute log function
log() {
  echo -e "🌸 $1"
}

log "Starting your custom terminal setup!"

# Get shell config file
if [[ "$SHELL" == *"zsh" ]]; then
  SHELL_RC="$HOME/.zshrc"
else
  SHELL_RC="$HOME/.bashrc"
fi

# Backup
cp "$SHELL_RC" "${SHELL_RC}.backup"
log "Backed up your original shell config to ${SHELL_RC}.backup"

# Add custom aliases
log "Adding custom aliases..."
cat aliases.sh >> "$SHELL_RC"

# Add ASCII art greeting
log "Adding cute ASCII greeting..."
echo -e '\ncat ~/custom_terminal_setup_install/ascii_art.txt' >> "$SHELL_RC"

# Optional: install cowsay/figlet if available
if command -v cowsay &> /dev/null; then
  echo 'cowsay "You got this! 💪"' >> "$SHELL_RC"
else
  log "Optional: install cowsay for fun terminal messages 🐮"
fi

log "All done! Restart your terminal or run 'source $SHELL_RC' to see it in action 💫"
