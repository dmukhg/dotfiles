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

# add colors
#TERM=xterm-256color
eval `dircolors -b ~/.dircolors`
# little aliases
alias ls="ls -l --group-directories-first --color=auto -X" # --ignore='*.o'"
alias snd=alsamixer
alias halt="sudo shutdown -Ph 0"
alias reboot="sudo shutdown -r 0"
alias hib="sudo hibernate"
alias rt="rm *~"
alias sl="ls"
alias g-node="sudo openvpn ~/.g-node/g-node-proxy.conf"
alias mp="ncmpc"
alias blog="cd ~/public/blog"
alias idea="cd ~/public/idealab"
alias q="exit"

# editor
alias e="gvim --remote-tab-silent"

# alias to call sorry
alias sorry="python ~/code/schatten/sorry/sorry/main.py"

export PATH=$PATH:/home/schatten/bin:/media/zacharius/installers/linux/google_appengine:/usr/lib/android-sdk/tools:/usr/lib/android-sdk/platform-tools
export TEXINPUTS=$TEXINPUTS:/usr/share/tex-common

export http_proxy=http://144.16.192.245:8080/
export https_proxy=http://144.16.192.247:8080/
# End of my configs

# Delete ~/Desktop which keeps on popping up for some reason. I
# suspect firefox but what the hell. This method doesn't seem too
# memory or resource intensive. But, got to come back to this someday.
# TODO
rm -rf /home/schatten/Desktop

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
# === Vi Mode editing enable
bindkey -v

# === python SimpleHTTPServer shortcut
alias shttp='python -m SimpleHTTPServer'
