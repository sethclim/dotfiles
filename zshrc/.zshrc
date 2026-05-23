





if [ "$TERM_PROGRAM" != "Apple_Terminal" ]; then
	eval "$(starship init zsh)"
	export STARSHIP_CONFIG=~/starship/starship.toml
fi
