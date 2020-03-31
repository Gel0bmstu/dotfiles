#
# ~/.bashrc
#
if [[ $COLORTERM = gnome-* && $TERM = xterm ]]  && infocmp gnome-256color >/dev/null 2>&1; then TERM=gnome-256color; fi
if tput setaf 1 &> /dev/null; then
    tput sgr0
    if [[ $(tput colors) -ge 256 ]] 2>/dev/null; then
      BASE03=$(tput setaf 234)
      BASE02=$(tput setaf 235)
      BASE01=$(tput setaf 240)
      BASE00=$(tput setaf 241)
      BASE0=$(tput setaf 244)
      BASE1=$(tput setaf 245)
      BASE2=$(tput setaf 254)
      BASE3=$(tput setaf 230)
      YELLOW=$(tput setaf 136)
      ORANGE=$(tput setaf 166)
      RED=$(tput setaf 160)
      MAGENTA=$(tput setaf 125)
      VIOLET=$(tput setaf 61)
      BLUE=$(tput setaf 33)
      CYAN=$(tput setaf 37)
      GREEN=$(tput setaf 64)
    else
      BASE03=$(tput setaf 8)
      BASE02=$(tput setaf 0)
      BASE01=$(tput setaf 10)
      BASE00=$(tput setaf 11)
      BASE0=$(tput setaf 12)
      BASE1=$(tput setaf 14)
      BASE2=$(tput setaf 7)
      BASE3=$(tput setaf 15)
      YELLOW=$(tput setaf 3)
      ORANGE=$(tput setaf 9)
      RED=$(tput setaf 1)
      MAGENTA=$(tput setaf 5)
      VIOLET=$(tput setaf 13)
      BLUE=$(tput setaf 4)
      CYAN=$(tput setaf 6)
      GREEN=$(tput setaf 2)
    fi
    BOLD=$(tput bold)
    RESET=$(tput sgr0)
else
    # Linux console colors. I don't have the energy
    # to figure out the Solarized values
    MAGENTA="\033[1;31m"
    ORANGE="\033[1;33m"
    GREEN="\033[1;32m"
    PURPLE="\033[1;35m"
    WHITE="\033[1;37m"
    BOLD=""
    RESET="\033[m"
fi

# Functions

# Make dir and cd into
mkcd () {
  mkdir "$1" && cd "$1";
}

gcp () {
  if [ "$1" == ''] ||! [ -f "$1" ];
    then 
      git add . 
      if [ "$1" == "" ] || [ $1 == "" ];
      then
        echo 'Please, set commit name in "" quotation mark' ;
        exit 0
      fi 
      git commit -m $1
  else 
    git add $1 
    if [ "$2" == "" ] || [ $2 == "" ];
    then
      echo 'Please, set commit name in "" quotation mark' ;
      exit 0
    fi 
    git commit $2
  fi
  
  if [[ "$3" == '' ]];
    then git push origin master
  else 
    git push origin "$3"
  fi
}

# Get files count
gfc () {
  if [[ "$1" == '' ]]
    then ls -la | wc -l
  else
    ls -la "$1" | wc -l
  fi
}

# Global variables
msa="35.228.159.44"
smb="//192.168.88.1/cloud"
dfp="/home/gel0/dotfiles"

alias ll='ls -alh --color=auto'
alias in='sudo apt-get install'
alias iny='sudo apt-get install $1 -y'
alias sin='sudo snap install'
alias rmv='sudo apt-get remove'
alias upd='sudo apt-get update -y'
alias upg='sudo apt-get upgrade -y'

alias view='sudo nomacs' 
alias copy='xclip -selection c'

# VPN 
alias vpn='sudo openvpn /media/d/vpn/vpn.ovpn'
alias vpnitc='sudo openvpn ~/vpn/solovyov.ovpn'
alias vpnfr='sudo openvpn /media/d/vpn/vpnbook-fr1-tcp80'

# CD to work
alias itcw='cd /media/d/work/itc/gl100/'
alias rsaw='cd /media/d/work/rosa/'
alias stud='cd /media/d/102'
alias tech='cd /media/d/tp/4'
alias dwnl='cd /media/d/downloads'

# Wifi settings
alias wfm='sudo wifi-menu'

# Config files edit

# Set text editor
editor=vim

alias pbc='sudo "$editor" ~/.config/polybar/config'
alias i3c='sudo "$editor" ~/.config/i3/config'
alias brc='sudo "$editor" ~/.bashrc'
alias vrc='sudo "$editor" ~/.vimrc'
alias drc='sudo "$editor" ~/.dunstrc'

# Get quotes
alias moex_quote='go run /media/d/bashScripts/moex_quotes/moex_quotes.go -t '

# Mount/unmount smb share folder
alias msb='sudo mount.cifs $smb /media/smb/ -o user=guest,iocharset=utf8,vers=2.0'
alias umsb='sudo umount $smb'

# Connect to my vps
alias cts='ssh gel0@$msa'

# Programs
alias ld='sudo lazydocker'

# Autocd by typing only path to dir
shopt -s autocd

parse_git_dirty () {
  [[ $(git status 2> /dev/null | tail -n1) != "nothing to commit (working directory clean)" ]] && echo "*"
}
parse_git_branch () {
  git branch --no-color 2> /dev/null | sed -e '/^[^*]/d' -e "s/* \(.*\)/\1$(parse_git_dirty)/"
}

PS1="\[${BOLD}${RED}\]\u\[$CYAN\]@\[$GREEN\]\h\[$ORANGE\]: \[$BASE\]\w\[$BASE0\]\$([[ -n \$(git branch 2> /dev/null) ]] && echo \" >> \")\[$BLUE\]\$(parse_git_branch) \[$BASE3\]\[$RESET\]\$ "

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi


[ -f ~/.fzf.bash ] && source ~/.fzf.bash
