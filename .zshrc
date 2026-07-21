# ┏━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┓
# ┃ 🌠 ~ Naksu's zsh configuration file      ┃
# ┗━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┛

# ┏━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┓
# ┃ ℹ️ ~ Fastfetch                           ┃
# ┗━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┛
if [[ -n "$TMUX" ]]; then
	[[ $- =~ i ]] && fastfetch --color "#C82828" --logo-type none;
else
	fastfetch --color "#C82828";
fi


# ┏━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┓
# ┃ ⏩ ~ Powerlevel10k - Instant Prompt      ┃
# ┗━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┛
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi


# ┏━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┓
# ┃ 🌐 ~ Environment Variables               ┃
# ┗━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┛
export GPG_TTY="$TTY"
export GOPATH="$HOME/.go"
export ZSH="$HOME/.oh-my-zsh"

# Reminder of OMZ update
zstyle ':omz:update' mode reminder 


# ┏━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┓
# ┃ ⚙️ ~ Oh My Zsh - Plugins & Configuration ┃
# ┗━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┛
plugins=(
  git
  fzf-tab
  zsh-autosuggestions
  zsh-syntax-highlighting
  zsh-fzf-history-search
)

source $ZSH/oh-my-zsh.sh

ZSH_HIGHLIGHT_HIGHLIGHTERS=(main cursor)
typeset -gA ZSH_HIGHLIGHT_STYLES


# ┏━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┓
# ┃ 🧩 ~ Custom Aliases                      ┃
# ┗━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┛
alias py="python3"
alias vim="nvim"
alias ip="ip -c"
alias svim="sudo -E nvim"
alias snvim="sudo -E nvim"
alias _venv="python3 -m venv .venv"
alias _tsm="~/Crafting_Table/game_servers/tsm.sh"

[ "$TERM" = "xterm-kitty" ] && alias ssh="kitty +kitten ssh"


# ┏━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┓
# ┃ 👁️ ~ Syntax Highlighting Theme           ┃
# ┗━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┛
source ~/.zsh/catppuccin_mocha-zsh-syntax-highlighting.zsh


# ┏━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┓
# ┃ 🏠 ~ PATH Configuration                  ┃
# ┗━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┛

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

# perl local lib
PATH="/home/naksu/perl5/bin${PATH:+:${PATH}}"; export PATH
PERL5LIB="/home/naksu/perl5/lib/perl5${PERL5LIB:+:${PERL5LIB}}"; export PERL5LIB
PERL_LOCAL_LIB_ROOT="/home/naksu/perl5${PERL_LOCAL_LIB_ROOT:+:${PERL_LOCAL_LIB_ROOT}}"; export PERL_LOCAL_LIB_ROOT
PERL_MB_OPT="--install_base \"/home/naksu/perl5\""; export PERL_MB_OPT
PERL_MM_OPT="INSTALL_BASE=/home/naksu/perl5"; export PERL_MM_OPT


# ┏━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┓
# ┃ 💎 ~ Powerlevel10K Theme                 ┃
# ┗━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┛
source /usr/share/zsh-theme-powerlevel10k/powerlevel10k.zsh-theme

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

