# The following lines were added by compinstall
zstyle :compinstall filename '/home/caesar/.zshrc'

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
alias ls="ls -l --color=auto -X --ignore='*.o'"
alias snd=alsamixer
alias halt="sudo shutdown -Ph 0"
alias reboot="sudo shutdown -r 0"
alias hib="sudo hibernate"
alias rt="rm *~"
alias sl="ls"
alias g-node="sudo openvpn ~/.g-node/g-node-proxy.conf"
alias mp="ncmpc"
alias journal="vim ~/public/links"

# alias to call sorry
alias sorry="python ~/code/sorry/sorry/main.py"

export PATH=$PATH:/home/caesar/bin:/media/zacharius/installers/linux/google_appengine

export XDG_DESKTOP_DIR=/home/caesar/.desktop
# hopefully, this will stop the Desktop Folder from popping up.

export http_proxy=144.16.192.245:8080
export https_proxy=144.16.192.245:8080
# End of my configs

# ===================== Mark functions =======================
# calling mark, sets up a cross process file ~/.mark_dir with 
# the value of the current directory
# hence forth, any terminal you open will be directed to this 
# directory
function m(){
    printf `pwd` > ~/.mark_dir
    echo 'Directory Marked'
}
# to turn this off, call unmark or call mark on some other directory
# unmark resets mark_dir to the home directory
function u(){
    printf ~ > ~/.mark_dir
    echo 'Directory Marked Reset to home'
    cd ~
}
read MARKDIR < ~/.mark_dir
cd $MARKDIR

# ===================== Mark functions =======================

# Setting up email
MAIL=/var/spool/mail/caesar && export MAIL
