brew install stow
brew install starship
brew install fzf
brew install zsh-autosuggestions
brew install eza
brew install tmux
brew install tmuxp

if [ ! -d "$HOME/.config/zsh/fzf-tab" ]; then
  git clone https://github.com/Aloxaf/fzf-tab "$HOME/.config/zsh/fzf-tab"
fi