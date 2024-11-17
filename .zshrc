# Set the terminal for GPG
export GPG_TTY=$TTY

# Enable Powerlevel10k instant prompt
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Powerlevel10k theme
source /usr/share/zsh-theme-powerlevel10k/powerlevel10k.zsh-theme

# Oh My Zsh setup
export ZSH="$HOME/.oh-my-zsh"
zstyle ':omz:update' mode reminder
source $ZSH/oh-my-zsh.sh

# Catppuccin color palette
source ~/catppuccin_mocha-zsh-syntax-highlighting.zsh

# Plugins
plugins=(
  git
  fzf-tab
  zsh-autosuggestions
  zsh-syntax-highlighting
  zsh-fzf-history-search
)

# Load fzf integration if available
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# Alias configuration
alias py="python3"
alias vim="nvim"
alias ip="ip -c"
alias _rando_name="python3 /home/naksu/Crafting_Table/code/python/rando_file_name.py"
[ "$TERM" = "xterm-kitty" ] && alias ssh="kitty +kitten ssh"

# Path configuration
export PATH="$HOME/.local/bin:$PATH"
export PATH="/home/naksu/perl5/bin:$PATH"
export PNPM_HOME="$HOME/.local/share/pnpm"
[[ -d $PNPM_HOME ]] && export PATH="$PNPM_HOME:$PATH"

# Pipx PATH (if it wasn't already covered above)
export PATH="$PATH:/home/nak/.local/bin"

# Pyenv setup
export PYENV_ROOT="$HOME/.pyenv"
[[ -d $PYENV_ROOT/bin ]] && export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"

# Perl environment setup
export PERL5LIB="/home/naksu/perl5/lib/perl5${PERL5LIB:+:${PERL5LIB}}"
export PERL_LOCAL_LIB_ROOT="/home/naksu/perl5${PERL_LOCAL_LIB_ROOT:+:${PERL_LOCAL_LIB_ROOT}}"
export PERL_MB_OPT="--install_base \"/home/naksu/perl5\""
export PERL_MM_OPT="INSTALL_BASE=/home/naksu/perl5"

# Powerlevel10k prompt configuration
[[ -f ~/.p10k.zsh ]] && source ~/.p10k.zsh

# Zsh Syntax Highlighting settings
ZSH_HIGHLIGHT_HIGHLIGHTERS=(main cursor)
typeset -gA ZSH_HIGHLIGHT_STYLES

