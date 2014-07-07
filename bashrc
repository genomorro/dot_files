# /etc/skel/.bashrc
#
# This file is sourced by all *interactive* bash shells on startup,
# including some apparently interactive shells such as scp and rcp
# that can't tolerate any output.  So make sure this doesn't display
# anything or bad things will happen !


# Test for an interactive shell.  There is no need to set anything
# past this point for scp and rcp, and it's important to refrain from
# outputting anything in those cases.
if [[ $- != *i* ]] ; then
	# Shell is non-interactive.  Be done now!
	return
fi


# Put your fun stuff here.
# Less Colors for Man Pages
# export LESS_TERMCAP_mb=$'\E[01;31m'      # begin blinking
# export LESS_TERMCAP_md=$'\E[01;31m'      # begin bold
# export LESS_TERMCAP_me=$'\E[0m'          # end mode
# export LESS_TERMCAP_se=$'\E[0m'          # end standout-mode                 
# export LESS_TERMCAP_so=$'\E[01;44;33m'   # begin standout-mode - info box
# export LESS_TERMCAP_ue=$'\E[0m'          # end underline
# export LESS_TERMCAP_us=$'\E[01;32m'      # begin underline

# Less Colors for Man Pages
export LESS_TERMCAP_mb=$'\E[01;31m'       # begin blinking
export LESS_TERMCAP_md=$'\E[01;38;5;74m'  # begin bold
export LESS_TERMCAP_me=$'\E[0m'           # end mode
export LESS_TERMCAP_se=$'\E[0m'           # end standout-mode
export LESS_TERMCAP_so=$'\E[38;5;246m'    # begin standout-mode - info box
export LESS_TERMCAP_ue=$'\E[0m'           # end underline
export LESS_TERMCAP_us=$'\E[04;38;5;146m' # begin underline

# Check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# Enable cdspell in order to correct minor errors in the spelling of
# a directory component in a cd command
shopt -s cdspell

# Bash attempts spelling correction on directory names during word
# completion if the directory name initially supplied does not exist
shopt -s dirspell

# a command name that is the name of a directory is executed as if
# it were the argument to the cd command
shopt -s autocd

PS1='┌─ [\#][\[\033[01;33m\]\t\[\033[0;0m\]][\[\033[01;32m\]\u@\h\[\033[0;0m\]][\[\033[01;34m\]\w\[\033[00m\]\[\033[0;0m\]]\n└$ '

alias ls='ls -h --color=auto'
alias grep='grep --colour=auto'
alias vi='$EDITOR'
alias emacs='$EDITOR'
alias less='$PAGER'

# enable bash completion in interactive shells
[ -f /etc/profile.d/bash-completion.sh ] && source /etc/profile.d/bash-completion.sh

#complete -cf sudo

# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.

export HISTSIZE=1000
export HISTFILESIZE=1000
export HISTCONTROL=erasedups

alias dmesg='dmesg | $PAGER'
alias lsmod='lsmod | $PAGER'
alias rm='rm -i'
alias howto='$PAGER /home/DATOS/Software/Linux/howto'
alias wicd='wicd-curses'

alias dist-update='sudo emerge --sync'
alias world-upgrade='sudo emerge -NuaDvt --autounmask-keep-masks --with-bdeps=y world'
alias system-upgrade='sudo emerge -NuavDt system'

alias make.conf='sudo $EDITOR /etc/make.conf'
alias package.mask='sudo $EDITOR /etc/portage/package.mask'
alias package.unmask='sudo $EDITOR /etc/portage/package.unmask'
alias package.use='sudo $EDITOR /etc/portage/package.use'
alias package.keywords='sudo $EDITOR /etc/portage/package.keywords'
alias package.license='sudo $EDITOR /etc/portage/package.license'

alias mountbt='sudo mount -t fuse obexautofs /media/bluetooth/ -o allow_other'
alias mount='mount | column -t'
alias ports='netstat -tulanp'
alias psmem='ps aux --sort -pmem'
alias psmem10='ps aux --sort -pmem | head -11' 
alias pscpu='ps aux --sort -pcpu'
alias pscpu10='ps aux --sort -pcpu | head -11'

alias reboot='sudo /sbin/reboot'
alias poweroff='sudo /sbin/poweroff'
alias halt='sudo /sbin/halt'
alias shutdown='sudo /sbin/shutdown'


# Functions

vfat() {
        sudo mount -o umask=07,gid=users,noatime,noexec,utf8=true $1 $2
}

copydvd() {
	dvdbackup -M -i $1 -o $2
}

md5string() {
	echo -n "$1" | md5sum
}

unpack () {
    if [[ -f $1 ]] ; then
        case $1 in
            *.tar.bz2)  tar -xvjf $1         ;;
            *.tar.gz)   tar -xvzf $1         ;;
            *.rar)      7z x $1              ;;
            *.deb)      ar -x $1             ;;
            *.bz2)      bzip2 -d $1          ;;
            *.lzh)      lha x $1             ;;
            *.gz)       gunzip -d $1         ;;
            *.tar)      tar -xvf $1          ;;
            *.tgz)      gunzip -d $1         ;;
            *.tbz2)     tar -jxvf $1         ;;
            *.zip)      unzip $1             ;;
            *.Z)        uncompress $1        ;;
            *)          echo "${1} Error!!!" ;;
        esac
    else
	echo "Uso: unpack ARCHIVO"
	echo "Donde ARCHIVO es bz2,gz,tar,rar,deb,lzh,tgz,tbz2,Z o zip" 
	echo "Tienes instalado bzip2, tar, p7zip, ar, lha, gzip, unzip"
    fi
}

genpasswd() {
	local l=$1
       	[ "$l" == "" ] && l=20
      	tr -dc A-Za-z0-9_ < /dev/urandom | head -c ${l} | xargs
}

# # GNUPG Agent
# envfile="${HOME}/.gnupg/gpg-agent.env"
# if test -f "$envfile" && kill -0 $(grep GPG_AGENT_INFO "$envfile" | cut -d: -f 2) 2>/dev/null; then
#     eval "$(cat "$envfile")"
# else
#     eval "$(gpg-agent --daemon --write-env-file "$envfile")"
# fi
# export GPG_AGENT_INFO  # the env file does not contain the export statement

if [ "$TERM" = "linux" ]; then
    echo -en "\e]P01e2320" #black
    echo -en "\e]P1705050" #darkred
    echo -en "\e]P260b48a" #darkgreen
    echo -en "\e]P3dfaf8f" #brown
    echo -en "\e]P4506070" #darkblue
    echo -en "\e]P5dc8cc3" #darkmagenta
    echo -en "\e]P68cd0d3" #darkcyan
    echo -en "\e]P7dcdccc" #lightgrey
    echo -en "\e]P8709080" #darkgrey
    echo -en "\e]P9dca3a3" #red
    echo -en "\e]PAc3bf9f" #green
    echo -en "\e]PBf0dfaf" #yellow
    echo -en "\e]PC94bff3" #blue
    echo -en "\e]PDec93d3" #magenta
    echo -en "\e]PE93e0e3" #cyan
    echo -en "\e]PFffffff" #white
    clear #for background artifacting
fi
