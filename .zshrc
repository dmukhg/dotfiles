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
TERM=xterm-256color
eval `dircolors -b ~/.dircolors`
# little aliases
alias ls="ls -l --color=auto -X"
alias snd=alsamixer
alias storage="sudo ntfs-3g /dev/sda5 /media/storage/"
alias windows="sudo ntfs-3g /dev/sda1 /media/windows/"
alias halt="sudo shutdown -Ph 0"
alias reboot="sudo shutdown -r 0"
alias hib="sudo hibernate"
alias rt="rm *~"
alias sl="ls"
alias lock="gnome-screensaver-command -l"
alias dslp="xset dmps force standby"

# alias for t
alias t='python ~/code/t/t.py --task-dir ~/.tasks --list'

export PYTHONPATH=$PYTHONPATH:~/code
export PATH=$PATH:/usr/lib/Komodo-IDE-5/bin/
export PATH=$PATH:/usr/local/lib/Komodo-Edit-5/bin

# export http_proxy=10.3.100.148:8080
# End of my configs

function init(){
# initializes my xmodmaps and wallpapers.
# also mounts storage
# to be manually called at startup
    awsetbg -c -r ~/graphics/wallpapers
    xmodmap ~/.Xmodmap
    sudo ntfs-3g /dev/sda5 /media/storage
}

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
}
read MARKDIR < ~/.mark_dir
cd $MARKDIR

# ===================== Mark functions =======================
