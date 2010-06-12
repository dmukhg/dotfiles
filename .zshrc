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
# End of lines configured by zsh-newuser-install
# Begin my configs
alias ls="ls -l --color=auto --hide='*.pyc' -X"
alias snd=alsamixer
alias storage="sudo ntfs-3g /dev/sda5 /media/storage/"
alias windows="sudo ntfs-3g /dev/sda1 /media/windows/"
alias halt="sudo shutdown -Ph 0"
alias reboot="sudo shutdown -r 0"
alias hib="sudo hibernate"
alias rt="rm *~"
alias sl="ls"

export PYTHONPATH=$PYTHONPATH:~/code

# export http_proxy=10.3.100.148:8080
# End of my configs
function init(){
echo "Setting up wallpapers................."
awsetbg ~/graphics/wallpapers/blue_ocean_view.jpg
echo "Done"
echo "\nSetting up xmodmap.................."
xmodmap ~/.Xmodmap
echo "Done"
sudo ntfs-3g /dev/sda5 /media/storage
}

cd /home/caesar/code
