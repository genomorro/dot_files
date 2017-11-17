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

# TTY Colors.
# if [ "$TERM" = "linux" ]; then
#     echo -en "\e]P0073642" #black
#     echo -en "\e]P1dc322f" #darkred
#     echo -en "\e]P2859900" #darkgreen
#     echo -en "\e]P3b58900" #brown
#     echo -en "\e]P4268bd2" #darkblue
#     echo -en "\e]P5d33682" #darkmagenta
#     echo -en "\e]P62aa198" #darkcyan
#     echo -en "\e]P7eee8d5" #lightgrey
#     echo -en "\e]P8002b36" #darkgrey
#     echo -en "\e]P9cb4b16" #red
#     echo -en "\e]PA586e75" #green
#     echo -en "\e]PB657b83" #yellow
#     echo -en "\e]PC839496" #blue
#     echo -en "\e]PD6c71c4" #magenta
#     echo -en "\e]PE93a1a1" #cyan
#     echo -en "\e]PFfdf6e3" #white
#     clear #for background artifacting
# fi

# Less Colors for Man Pages
export LESS_TERMCAP_mb=$'\E[01;31m'      # begin blinking
export LESS_TERMCAP_md=$'\E[00;31m'      # begin bold
export LESS_TERMCAP_me=$'\E[0m'          # end mode
export LESS_TERMCAP_se=$'\E[0m'          # end standout-mode                 
export LESS_TERMCAP_so=$'\E[01;47;30m'   # begin standout-mode - info box
export LESS_TERMCAP_ue=$'\E[0m'          # end underline
export LESS_TERMCAP_us=$'\E[00;32m'      # begin underline

# Change the window title of X terminals 
case ${TERM} in
	st*|xterm*|rxvt*|Eterm*|aterm|kterm|gnome*|interix)
		PROMPT_COMMAND='echo -ne "\033]0;${USER}@${HOSTNAME%%.*}:${PWD/#$HOME/~}\007"'
		;;
	screen*)
		PROMPT_COMMAND='echo -ne "\033_${USER}@${HOSTNAME%%.*}:${PWD/#$HOME/~}\033\\"'
		;;
esac

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

# Source: http://tinyurl.com/gvykz7g
parse_git_branch () {
    c_red=`tput setaf 1`
    c_green=`tput setaf 2`
    c_sgr0=`tput sgr0`

    if git rev-parse --git-dir >/dev/null 2>&1
    then
	gitver=$(git branch 2>/dev/null| sed -n '/^\*/s/^\* //p')
	if git diff --quiet 2>/dev/null >&2
	then
	    gitver=${c_green}' ['$gitver']'${c_sgr0}
	else
	    gitver=${c_red}' !['$gitver']'${c_sgr0}
	fi
    else
	return 0
    fi
    echo $gitver
}

PS1='┌─ [\!][\[\033[00;33m\]\t\[\033[0;0m\]][\[\033[0;32m\]\u@\h\[\033[0;0m\]][\[\033[00;34m\]\w\[\033[00m\]\[\033[0;0m\]]\[$(parse_git_branch)\]\n╰► '

# enable bash completion in interactive shells
[ -f /etc/profile.d/bash-completion.sh ] && source /etc/profile.d/bash-completion.sh

export HISTSIZE=10000
export HISTFILESIZE=10000
export HISTCONTROL=erasedups
export HISTTIMEFORMAT="%F %T "
export PATH=$PATH:$HOME/.local/bin

#complete -cf sudo

# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.

[[ -f $HOME/.bash_aliases ]] && . $HOME/.bash_aliases
