# -*- mode: shell-script; -*-

alias ls='ls -h --color=auto --group-directories-first --time-style=+"%F %T" -F'
alias grep='grep --colour=auto'
alias vi='TERM=xterm-256color $EDITOR'
alias emacs='TERM=xterm-256color $EDITOR'
alias less='$PAGER'

alias dmesg='dmesg | $PAGER'
alias lsmod='lsmod | $PAGER'
alias rm='rm -i'
alias df='df -h'
alias free='free -m'
alias rsync='rsync -rcvu'
alias howto='$PAGER /home/DATOS/Software/Linux/howto'

alias world-upgrade='sudo emerge -NuaDvt --autounmask-keep-masks --with-bdeps=y world'
alias system-upgrade='sudo emerge -NuavDt system'

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

alias genpasswd='gpg --gen-random --armor 1 8'

# Functions

drive() {
    sudo mount.davfs -o uid=1000,gid=1000,dir_mode=775 https://dav.mailbox.org/servlet/webdav.infostore $HOME/Drive
}

copydvd() {
	dvdbackup -M -i $1 -o $2
}

md5string() {
	echo -n "$1" | md5sum
}

oga() {
    for f in *.mp3 ; do ffmpeg -i "$f" -c:a libvorbis -qscale:a 9 "${f%.mp3}.oga" ; done
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

# genpasswd() {
# 	local l=$1
#        	[ "$l" == "" ] && l=20
#       	tr -dc A-Za-z0-9_ < /dev/urandom | head -c ${l} | xargs
# }
