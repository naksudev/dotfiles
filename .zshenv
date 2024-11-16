# Do not execute pftech on neovim instances
if [[ -z "$NVIM" ]]; then
	pfetch | lolcat
fi
