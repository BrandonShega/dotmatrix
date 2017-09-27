fpath=(
  $fpath
  ~/.rvm/scripts/zsh/Completion
  ~/.zsh/functions
  /usr/local/share/zsh/site-functions
)

## Sources
source "$HOME/.sharedrc"
source $HOME/.zsh/aliases
source $HOME/.zsh/exports
source $HOME/.zsh/path
source $HOME/.zsh/functions

## ZStyle
zstyle ':completion:*:*:kill:*:processes' list-colors '=(#b) #([0-9]#) ([0-9a-z-]#)*=01;34=0=01'
zstyle ':completion:*:*:*:*:processes' command "ps -u `whoami` -o pid,user,comm -w -w"
zstyle ':completion:*:ssh:*' tag-order hosts users
zstyle ':completion:*:ssh:*' group-order hosts-domain hosts-host users hosts-ipaddr
zstyle ':completion:*:functions' ignored-patterns '_*'
zstyle ':completion:*' accept-exact '*(N)'
zstyle ':completion:*' use-cache on
zstyle ':completion:*' cache-path ~/.zshcache

## Autoload
autoload colors; colors
autoload -U compinit; compinit
autoload edit-command-line
autoload -U promptinit; promptinit;
zle -N edit-command-line

## Keybinds
bindkey -e
bindkey '^x^e' edit-command-line
bindkey '\ep' up-line-or-search
bindkey '\en' down-line-or-search
bindkey '\ew' kill-region

if [ -z "$TMUX" ]; then
  fg-widget() {
    stty icanon echo pendin -inlcr < /dev/tty
    stty discard '^O' dsusp '^Y' lnext '^V' quit '^\' susp '^Z' < /dev/tty
    zle reset-prompt
    if jobs %- >/dev/null 2>&1; then
      fg %-
    else
      fg
    fi
  }

  zle -N fg-widget
  bindkey -M emacs "^Z" fg-widget
  bindkey -M vicmd "^Z" fg-widget
  bindkey -M viins "^Z" fg-widget
fi

## Options
setopt appendhistory
setopt extendedglob
setopt histignoredups
setopt nonomatch
setopt prompt_subst
setopt interactivecomments
setopt autoparamslash
setopt autopushd
setopt correct
setopt correctall
setopt autocd

## Histroy
HISTFILE=~/.zsh_history
HISTSIZE=5000
SAVEHIST=10000
setopt APPEND_HISTORY
setopt INC_APPEND_HISTORY


## Functions

l.() {
  ls -ld "${1:-$PWD}"/.[^.]*
}

cuke() {
  local file="$1"
  shift
  cucumber "features/$(basename $file)" $@
}
compctl -g '*.feature' -W features cuke

## Import
zrcl="$HOME/.zshrc.local"
[[ ! -a $zrcl ]] || source $zrcl

## Misc
cdpath=(~ ~/src $DEV_DIR $SOURCE_DIR)
typeset -aU path

## External
if which swiftenv > /dev/null; then eval "$(swiftenv init -)"; fi # SwiftEnv
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh" # NVM
if [[ -s "$HOME/.rvm/scripts/rvm" ]] ; then source "$HOME/.rvm/scripts/rvm" ; fi # RVM
source $ZSH/oh-my-zsh.sh # Oh-My-ZSH
eval `docker-machine env 2>/dev/null` # Docker
prompt pure # Pure Prompt

ZSH_THEME="edvardm"
