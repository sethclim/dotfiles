
if [ "$TERM_PROGRAM" != "Apple_Terminal" ]; then
	eval "$(starship init zsh)"
	export STARSHIP_CONFIG=~/starship/starship.toml
fi

autoload -Uz compinit
compinit
source ~/.config/zsh/fzf-tab/fzf-tab.plugin.zsh

export FZF_DEFAULT_OPTS='
  --height=80%
  --layout=reverse
  --border=rounded

  --color=fg:7
  --color=fg+:15
  --color=bg:-1
  --color=bg+:8

  --color=hl:6
  --color=hl+:14

  --color=info:8
  --color=prompt:6
  --color=pointer:6
  --color=marker:6
  --color=spinner:6

  --color=header:8
  --color=border:8
  --color=gutter:-1
  --color=scrollbar:8
'

# disable sort when completing `git checkout`
zstyle ':completion:*:git-checkout:*' sort false
# set descriptions format to enable group support
# NOTE: don't use escape sequences (like '%F{red}%d%f') here, fzf-tab will ignore them
zstyle ':completion:*:descriptions' format '[%d]'
# set list-colors to enable filename colorizing
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}
# force zsh not to show completion menu, which allows fzf-tab to capture the unambiguous prefix
zstyle ':completion:*' menu no
# preview directory's content with eza when completing cd
zstyle ':fzf-tab:complete:cd:*' fzf-preview 'eza -1 --color=always $realpath'
# custom fzf flags
# NOTE: fzf-tab does not follow FZF_DEFAULT_OPTS by default
zstyle ':fzf-tab:*' fzf-flags \
  --color=fg:7,bg:-1,hl:6,fg+:15,bg+:8,hl+:14,prompt:6,pointer:6,marker:6,spinner:6,info:8,header:8 \
  --bind=tab:accept \
  --height=80%
# To make fzf-tab follow FZF_DEFAULT_OPTS.
# NOTE: This may lead to unexpected behavior since some flags break this plugin. See Aloxaf/fzf-tab#455.
zstyle ':fzf-tab:*' use-fzf-default-opts yes
# switch group using `<` and `>`
zstyle ':fzf-tab:*' switch-group '<' '>'
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'

# History
HISTSIZE=5000
HISTFILE=~/.zsh_history
SAVEHIST=$HISTSIZE

source $(brew --prefix)/share/zsh-autosuggestions/zsh-autosuggestions.zsh

bindkey '^ E' autosuggest-accept

# Aliases
alias ls='ls --color'

# Shell integrations
eval "$(fzf --zsh)"
