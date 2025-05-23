#!/bin/bash

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

# Cute log function
log() {
  echo -e "- $1"
}

log "Starting your custom terminal setup!"

# Get shell config file
if [[ "$SHELL" == *"zsh" ]]; then
  SHELL_RC="$HOME/.zshrc"
  shell="zsh"
else
  SHELL_RC="$HOME/.bashrc"
  shell="bash"
fi

# Backup
cp "$SHELL_RC" "${SHELL_RC}.backup"
log "Backed up your original shell config to ${SHELL_RC}.backup"

# Add custom aliases
log "Adding custom aliases..."
cat aliases.sh >> "$SHELL_RC"

# ——— Add ASCII art greeting ———
log "Adding cute ASCII greeting…"

# Copy art file to a stable home location
cp ascii_art.txt "$HOME/.ascii_art.txt"

# Remove any old snippet between our markers (so reruns stay clean)

# on macOS: sed needs the '' after -i
# ——— Add ASCII art greeting ———
log "Adding cute ASCII greeting…"

# Copy art file…
cp ascii_art.txt "$HOME/.ascii_art.txt"


sed -i '' '/# Cute ASCII greeting/,/fi/d' "$SHELL_RC"

# Append a single, safe cat-if-exists snippet
cat << 'EOF' >> "$SHELL_RC"

# Cute ASCII greeting
if [ -f "$HOME/.ascii_art.txt" ]; then
  cat "$HOME/.ascii_art.txt"
fi
EOF


# Offer to install Starship (prompt)
echo ""
read -p "Do you want to install the Starship prompt for a nicer shell experience? (y/n): " install_starship
if [ "$install_starship" = "y" ]; then
  curl -sS https://starship.rs/install.sh | sh
  echo "eval \"\$(starship init $shell)\"" >> ~/.${shell}rc

  log "Starship installed and added to your shell config."
fi

# Offer to install Oh My Zsh (only if using Zsh)
if [ "$shell" == "zsh" ]; then
  echo ""
  read -p "Do you want to install Oh My Zsh for themes and plugins? (y/n): " install_omz
  if [ "$install_omz" = "y" ]; then
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
    log "Oh My Zsh installed!"
  fi
fi

log "All done! Restart your terminal or run 'source $SHELL_RC' to see it in action :)"
