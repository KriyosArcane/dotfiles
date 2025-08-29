#!/usr/bin/env bash

# Define paths
SOURCE="$HOME/.config"
DEST="$HOME/dotfiles-config"

# Folders to sync
FOLDERS=(
  nvim
  zellij
  espanso
  kitty
  alacritty
  terminator
  dunst
  rofi
  hypr
  obsidian
)

# Create destination if not exists
mkdir -p "$DEST"

# Copy folders
for f in "${FOLDERS[@]}"; do
  if [ -d "$SOURCE/$f" ]; then
    cp -r "$SOURCE/$f" "$DEST/"
    echo "Copied $f"
  else
    echo "Skipping $f (not found)"
  fi
done

# Create basic .gitignore
cat > "$DEST/.gitignore" <<EOL
# Ignore caches and backups
*/Cache/
*/cache/
*.bak
*.old
*.log
*.swp
EOL

echo ".gitignore created"

# Initialize git if needed
cd "$DEST" || exit
if [ ! -d ".git" ]; then
  git init
  git branch -M main
  echo "Git repo initialized"
fi

# Add and commit
git add .
git commit -m "Initial com

