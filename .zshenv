# Do not execute pftech on neovim instances
if [[ -z "$NVIM" ]]; then
	pfetch | lolcat
fi

# Ensure GPG prompts use the current terminal sessions (e.g., SSH).
if [[ -n "$SSH_CLIENT" || -n "$SSH_TTY" ]]; then
	export GPG_TTY=$(tty)
fi
