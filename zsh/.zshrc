# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:$HOME/.local/bin:/usr/local/bin:$PATH

# Path to your Oh My Zsh installation.
export ZSH="$HOME/.oh-my-zsh"
export PATH="$PATH:$(go env GOBIN):$(go env GOPATH)/bin"

# Disable beep
unsetopt BEEP

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time Oh My Zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="powerlevel10k/powerlevel10k"

plugins=(
	git
)

source $ZSH/oh-my-zsh.sh

eval "$(~/.local/bin/mise activate)"
eval "$(zoxide init zsh)"
eval "$(fnm env --use-on-cd --shell zsh --corepack-enabled)"

# Aliases
alias cd="z"
alias task="go-task"
alias c="chezmoi"

# pnpm
export PNPM_HOME="/home/bultz/.local/share/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac
# pnpm end


# ZVM
export ZVM_INSTALL="$HOME/.zvm/self"
export PATH="$PATH:$HOME/.zvm/bin"
export PATH="$PATH:$ZVM_INSTALL/"
# -- Update ZVM master and ZLS
alias zvmup="zvm i --zls --full master"
alias ls='eza --group-directories-first'

vivaldi() {
	/mnt/c/Users/testm/AppData/Local/Vivaldi/Application/vivaldi.exe "$(wslpath -w $(realpath $1))"
}

export ROTZ_INSTALL="/home/bultz/.rotz"
export PATH="$ROTZ_INSTALL/bin:$PATH"
alias r="rails"

export GEM_HOME="$(gem env user_gemhome)"
export PATH="$PATH:$GEM_HOME/bin"

source $HOME/.zprofile

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh


