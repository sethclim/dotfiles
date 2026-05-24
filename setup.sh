DOTFILES="$HOME/dotfiles"
stow .
ln -sf \
  "$DOTFILES/iterm2/Profiles.json" \
  "$HOME/Library/Application Support/iTerm2/DynamicProfiles/Profiles.json"



