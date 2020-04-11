# The following lines were added by compinstall
zstyle :compinstall filename '/home/schatten/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall
# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
# End of lines configured by zsh-newuser-install
# Begin my configs
setopt autocd

autoload -U promptinit
promptinit
prompt walters cyan

PS1="%n@%F{green}%m%u%f>"

# For macports
export PATH=/opt/local/libexec/gnubin/:/opt/local/bin:/opt/local/sbin:$PATH
export MANPATH=/opt/local/share/man:$MANPATH
#export DYLD_LIBRARY_PATH=/usr/lib:/opt/local/lib
unset DYLD_LIBRARY_PATH

# Report CPU usage for commands running longer than 5 seconds
REPORTTIME=5

# add colors
#TERM=xterm-256color
eval `dircolors -b ~/.dircolors`

# little aliases
alias ls="ls -H -l --group-directories-first --color=auto -X" # --ignore='*.o'"
alias rt="rm *~"
alias sl="ls"
alias diff="colordiff -c"
alias less="less -r"

# Pacman Aliases
alias pf="pacman -Ss"
alias pi="sudo pacman -S"
alias pu="sudo pacman -Sy"

# editor
alias vi="nvim"
alias vim="nvim"
alias vimpackdir=".local/share/nvim/site/pack/vendor/start"

export no_proxy="localhost,127.0.0.1,10.*"
# End of my configs

# Shell bookmarks https://gist.github.com/835531

function _uh { [[ -z $DEV ]]; return $? }

function userroot {
  if ! _uh; then echo $DEV;
  else echo $HOME; fi
}

function _sdirname {
  echo "$(userroot)/.sdirs"
}

function _sglobalname {
  echo "${HOME}/.sdirs"
}

function _ss_for_arg {
  local d n;
  if [[ -z $1 ]]; then return; fi
  if [[ "${1[0,1]}" == "+" ]]; then d="$(_sglobalname)"; n="${1[2,-1]}";
  else d="$(_sdirname)"; n="$1"; fi
  echo "local sdir arg; sdir=\"$d\"; arg=\"$n\";"
}

# Shell Bookmarks (inspired by rpetrich.)
function dbg {
  if [[ -z $1 ]]; then return; fi
  eval $(_ss_for_arg $1);
  echo $sdir;
  echo $arg;
}
function s {
    if [[ -z $1 ]]; then return; fi
    eval $(_ss_for_arg $1);
    if [[ -f "$sdir" ]]; then
      grep -v "^export _BOOKMARK_$arg" "${sdir}" > "${sdir}1"
      mv "${sdir}1" "${sdir}"
    fi
    echo "export _BOOKMARK_$arg=$PWD" >> "${sdir}"
}

function l {
  if [[ -s $(_sdirname) ]]; then
    sed -e 's/^export _BOOKMARK_\([^=]*\)=\(.*\)$/\1 (\2)/g' "$(_sdirname)" | sort
  fi
  if ! _uh; then
    if [[ -s $(_sglobalname) ]]; then
      sed -e 's/^export _BOOKMARK_\([^=]*\)=\(.*\)$/+\1 (\2)/g' "$(_sglobalname)" | sort
    fi
  fi
}

function g {
  eval $(_ss_for_arg $1)
  . "$sdir"
  cd $(eval echo $(echo \$_BOOKMARK_$arg))
}

function d {
  if [[ -z $1 ]]; then return; fi
  eval $(_ss_for_arg $1)
  if [[ -f "$sdir" ]]; then
    grep -v "^export _BOOKMARK_$arg" "${sdir}" > "${sdir}1"
    mv "${sdir}1" "${sdir}"
  fi
}

function _gcomp {
  local descs globals;
  descs=();
  globals=();
  sed -e 's/^export _BOOKMARK_\([^=]*\)=\(.*\)$/\1:\2/g' "$(_sdirname)" | sort | while read line; do
    descs[$(($#descs+1))]="$line"
  done
  if ! _uh; then
    sed -e 's/^export _BOOKMARK_\([^=]*\)=\(.*\)$/+\1:\2/g' "$(_sglobalname)" | sort | while read line; do
      globals[$(($#globals+1))]="$line"
    done
  fi
  _describe -t bookmarks "shell bookmark" descs; _describe -t bookmarks "global bookmark" globals
}
compdef _gcomp g

function m() {
# mark this directory to be opened each time a new terminal is
# spawned.
  printf `pwd` > ~/.mark_dir
  echo 'Directory marked'
}

function u() {
# unmark directory and open the ~ directory each time a new terminal
# is spawned. 
  printf ~ > ~/.mark_dir
  echo 'Directory Mark reset to home'
  cd ~
}

# The real cd function. 
read MARKDIR < ~/.mark_dir
#cd $MARKDIR
# === Vi Mode editing enable
bindkey -v

# === python SimpleHTTPServer shortcut
alias shttp='python3 -m http.server'

# === alias git to hub to use github from cmdline
alias git="hub"

export GOPATH=~/.go_modules

# Android studio sdk
export ANDROID_HOME=$HOME/Library/Android/sdk

# Locale
export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8

# Sublime
alias subl="/Applications/Sublime\ Text.app/Contents/SharedSupport/bin/subl"

# Add gnucoreutils to path
PATH="/usr/local/opt/coreutils/libexec/gnubin:$PATH"

alias epubcheck="java -jar /usr/local/epubcheck/epubcheck.jar"

# GO Environment
export GOPATH=$HOME/repos/learning/go
export PATH=$PATH:$GOPATH/bin

# Blog
alias publish='function _publish(){ pushd ~/repos/github/dipanjan.blog; git add .; git commit -m"$1"; git push; popd};_publish'

# kubectl aliases
alias kd="kubectl --context=cen0 -n dev"
alias kp="kubectl --context=sin0 -n prod"

# Java 
export JAVA_HOME="/Library/Java/JavaVirtualMachines/jdk1.8.0_241.jdk/Contents/Home/"

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
