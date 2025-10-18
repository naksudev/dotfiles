# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# ------------------------------------
# My personal zsh configuration file
# ------------------------------------

# Global
# -----------------------------
export GPG_TTY="$TTY"
export GOPATH="$HOME/.go"

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Reminder of OMZ update
zstyle ':omz:update' mode reminder 

# Plugins
plugins=(git fzf-tab zsh-autosuggestions zsh-syntax-highlighting zsh-fzf-history-search)

source $ZSH/oh-my-zsh.sh

ZSH_HIGHLIGHT_HIGHLIGHTERS=(main cursor)
typeset -gA ZSH_HIGHLIGHT_STYLES

# User-defined 
# -----------------------------
alias py="python3"
alias vim="nvim"
alias ip="ip -c"
alias _venv="python3 -m venv .venv"
alias _tsm="sudo ~/Crafting_Table/game_servers/tsm.sh"

[ "$TERM" = "xterm-kitty" ] && alias ssh="kitty +kitten ssh"

source ~/.zsh/catppuccin_mocha-zsh-syntax-highlighting.zsh

# PATHs
# -----------------------------

# pipx
export PATH="$PATH:/home/naksu/.local/bin"

# pnpm
export PNPM_HOME="/home/naksu/.local/share/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac

# pyenv
export PYENV_ROOT="$HOME/.pyenv"
[[ -d $PYENV_ROOT/bin ]] && export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init - zsh)"

PATH="/home/naksu/perl5/bin${PATH:+:${PATH}}"; export PATH;
PERL5LIB="/home/naksu/perl5/lib/perl5${PERL5LIB:+:${PERL5LIB}}"; export PERL5LIB;
PERL_LOCAL_LIB_ROOT="/home/naksu/perl5${PERL_LOCAL_LIB_ROOT:+:${PERL_LOCAL_LIB_ROOT}}"; export PERL_LOCAL_LIB_ROOT;
PERL_MB_OPT="--install_base \"/home/naksu/perl5\""; export PERL_MB_OPT;
PERL_MM_OPT="INSTALL_BASE=/home/naksu/perl5"; export PERL_MM_OPT;

source /usr/share/zsh-theme-powerlevel10k/powerlevel10k.zsh-theme

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

