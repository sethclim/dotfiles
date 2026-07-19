DOTFILES="$HOME/dotfiles"

STOW_IGNORE='^tmux$|^iterm2$|^\.git$|^\.DS_Store$'
stow --ignore="$STOW_IGNORE" .

ln -sf \
  "$DOTFILES/iterm2/Profiles.json" \
  "$HOME/Library/Application Support/iTerm2/DynamicProfiles/Profiles.json"

rm -f "$HOME/.tmux.conf"
ln -sf \
   "$DOTFILES/tmux/.tmux.conf" \
   "$HOME/.tmux.conf"