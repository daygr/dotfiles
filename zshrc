# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

### .zshrc by gday

## Load custom aliases
source ~/.aliases.zsh

# Init zsh standard stuff
autoload -Uz compinit
compinit

## Antigen vars
#export ADOTDIR="${HOME}/.antigen"
#export ANTIGEN_COMPDUMP="${ADOTDIR}/.zcompdump"
#export ANTIGEN_LOG="${ADOTDIR}/antigen.log"
#export ANTIGEN_DEBUG_LOG="${ADOTDIR}/antigen_debug.log"
#export ANTIGEN_CACHE=false
#export ANTIGEN_CHECK_FILES=(${HOME}/.zshrc)

# Load Antigen
#source /usr/share/zsh/share/antigen.zsh
#source ~/antigen.zsh
source ~/git/antigen/bin/antigen.zsh

## Load oh-my-zsh lib files
#antigen bundle robbyrussell/oh-my-zsh lib/
antigen use oh-my-zsh

## Set zsh theme
#antigen theme tonotdo
#antigen theme agnoster
#antigen theme af-magic
source /usr/share/zsh-theme-powerlevel10k/powerlevel10k.zsh-theme

## plugins with issues
    #git
    #git-extras
    #gitfast

## Load antigen bundles
antigen bundles << EOBUNDLES
    catimg
    command-not-found
    cp
    extract
    history
    httpie
    per-directory-history
    git
    git-extras
    gitfast
    pip
    python
    ssh-agent
    sudo
    thefuck
    tmuxinator
    virtualenv
    wd
    web-search
    zsh-users/zsh-autosuggestions
    zsh-users/zsh-syntax-highlighting
EOBUNDLES

## complete antigen setup
antigen apply

# gpg stuff
GPG_TTY=$(tty)
export GPG_TTY

# PS1 stuff
if [[ $(hostname) == "mesaana" ]]; then
    DEFAULT_USER="gday"
    prompt_context(){}
fi

# powerline
powerline-daemon -q
. /usr/lib/python3.8/site-packages/powerline/bindings/zsh/powerline.zsh

#IDK stuff
export BROWSER=chromium
export TERMINAL=gnome-terminal

# Ruby
export PATH="$PATH:$(ruby -e 'puts Gem.user_dir')/bin"

# TrueFit/Oalib stuff
export OAHOME=$HOME/src
export PATH=$PATH:$HOME/bin:$HOME/go/bin:$HOME/src/oalib/bin:$HOME/src/gdaytools

# cloud completions
source <(awless completion zsh)
source /opt/google-cloud-sdk/completion.zsh.inc
source /opt/google-cloud-sdk/path.zsh.inc
# Completion for kitty
kitty + complete setup zsh | source /dev/stdin

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# Suppress powerlevel10k prompt warning
typeset -g POWERLEVEL9K_INSTANT_PROMPT=quiet

# Swap capslock for escape
setxkbmap -layout us -option caps:escape
