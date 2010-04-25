# The following lines were added by compinstall
cd /home/caesar/
zstyle :compinstall filename '/home/caesar/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall
# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
alias snd=alsamixer
# End of lines configured by zsh-newuser-install
# Begin my configs
alias ls="ls -l --color=auto"
alias storage="sudo ntfs-3g /dev/sda5 /media/storage/"
alias windows="sudo ntfs-3g /dev/sda1 /media/windows/"
alias rt="rm *~"

export http_proxy = 10.3.100.148:8080
# End of my configs

