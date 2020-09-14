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

# Global variables
GOPATH="~/go"
bsp='/media/d/bashScripts'

msa="35.228.159.44"
smb="//192.168.88.1/cloud"

# System commands
alias g='grep $1 --color=auto'
alias l='ls -l --color=auto'
alias t='tail -n 20'
alias ll='ls -alh --color=auto'
alias rld='. ~/.bashrc'
alias uprt='sudo netstat -ntulp | g LISTEN'
alias fprt='sudo netstat -ntulp | grep -v LISTEN'
alias sudo='sudo '

alias sctl='sudo systemctl'
alias sctlst='sudo systemctl start'
alias sctlrl='sudo systemctl reload'
alias sctlrs='sudo systemctl restart'
alias sctlss='sudo systemctl status'
alias sctlsp='sudo systemctl stop'
alias sctlel='sudo systemctl enable'
alias sctldl='sudo systemctl disable'

alias jctl='sudo journalctl'

# Packet manager commands
pmng='dnf'

alias in='sudo $pmng install'
alias iny='sudo $pmng install $1 -y'
alias rmv='sudo $pmng remove $1 -y'
alias upd='sudo $pmng update -y'
alias upg='sudo $pmng upgrade -y'
alias sch='sudo $pmng search $1'
alias bd='sudo dnf builddep *.spec' 

# Snap commands
alias sin='sudo snap install'
alias srmv='sudo snap remove $1'

# Translate commands
alias trb='trans :ru --brief $1'
alias teb='trans :en --brief $1'
alias tr='trans :ru $1'
alias te='trans :en $1'

# Docker commands
alias dpsa='sudo docker ps -a'
alias dps='sudo docker ps'

alias view='sudo nomacs' 
alias copy='xclip -selection c'
alias upload="curl -F 'sprunge=<-' http://sprunge.us"

alias e='$editor'
# alias cal='gcal --starting-day=1'

alias h='history'
alias hg='history | grep $1 --color=auto' 

# VPN 
alias vpn='sudo openvpn /media/d/vpn/vpn.ovpn'
alias vpnitc='sudo openvpn ~/vpn/solovyov.ovpn'
alias vpnfr='sudo openvpn /media/d/vpn/vpnbook-fr1-tcp80'

# CD to dir
alias itcw='cd /media/d/work/itc/gl100/'
alias rsaw='cd /media/d/work/rosa/'
alias stud='cd /media/d/102'
alias tech='cd /media/d/tp/4'
alias dwnl='cd /media/d/downloads'
alias pswd='cd /media/d/.password-store'
alias dotf='cd ~/dotfiles'
alias bshs='cd /media/d/bashScripts'
alias prts='cd /media/d/screenshots'
alias prjc='cd /media/d/projects'

# Wifi settings
alias wfm='sudo wifi-menu'

# Passwords control
alias p="pass insert -m"
alias pp='pass git push origin master'
alias pe='pass edit'
alias pg='pass generate -c'
alias pc='pass -c'

# Config files edit

# Set text editor
editor=vim

alias pbc='"$editor" ~/.config/polybar/config'
alias i3c='"$editor" ~/.config/i3/config'
alias brc='"$editor" ~/.bashrc'
alias vrc='"$editor" ~/.vimrc'
alias nvrc='"$editor" ~/.config/nvim/init.vim'
alias drc='"$editor" ~/.dunstrc'

# Get quotes
alias moex_quote='go run /media/d/bashScripts/moex_quotes/moex_quotes.go -t '

# Mount/unmount smb share folder
alias msb='sudo mount.cifs $smb /media/smb/ -o user=guest,iocharset=utf8,vers=2.0'
alias umsb='sudo umount $smb'

# Connect to my vps
alias cts='ssh gel0@$msa'

# Programs
alias ld='sudo lazydocker'
alias gcp='python3 $bsp/gcp.py'

# Bash history settings
HISTTIMEFORMAT="%h %d %H:%M:%S " # History format
HISTSIZE=10000                   # Max fixstory command store
HISTFILESIZE=10000               # Max history line store
PROMPT_COMMAND='history -a'      # Save commands in history after execution

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

alias ptch='git init && git add . && git commit -qm "init" && git checkout -b patch' 

abp () { 
        abb buildp && cd ./BUILD && cd $(ls -d */|head -n 1) && ptch
}

show_path () {
        echo $(pwd)
}

rmbl () {
        sudo rm -rf *.*.buildlog 
}

rmbd () {
        sudo rm -rf BUILD/ BUILDROOT/ RPMS/ SPECS/ SRPMS
}
