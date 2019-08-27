# /etc/skel/.bash_profile

## This file is sourced by bash for login shells.  The following line
## runs your .bashrc and is recommended by the bash info pages.
[[ -f ~/.bashrc ]] && . ~/.bashrc

# GPG_TTY=$(tty)

# envfile="$HOME/.gnupg/gpg-agent.env"
# if [[ -e "$envfile" ]] && kill -0 $(grep GPG_AGENT_INFO "$envfile" | cut -d: -f 2) 2>/dev/null; then
#     eval "$(cat "$envfile")"
# else
# #    eval "$(gpg-agent --daemon --enable-ssh-support --write-env-file "$envfile")"
#     eval "$(gpg-agent --daemon --write-env-file "$envfile")"
# fi
# export GPG_AGENT_INFO  # the env file does not contain the export statement
# export SSH_AUTH_SOCK   # enable gpg-agent for ssh
# export GPG_TTY         # reflect the output of the tty command

export PATH=$PATH:$HOME/.local/bin

export XDG_CACHE_HOME=/tmp/genomorro/.cache
if [ ! -f $XDG_CACHE_HOME ];
then
    mkdir -p -m 0700 $XDG_CACHE_HOME
fi 

## Stable SSH Agent from http://mah.everybody.org/docs/ssh
SSH_ENV="$HOME/.ssh/environment"
function start_agent {
    echo "Initialising new SSH agent..."
    /usr/bin/ssh-agent | sed 's/^echo/#echo/' > "${SSH_ENV}"
    echo succeeded
    chmod 600 "${SSH_ENV}"
    . "${SSH_ENV}" > /dev/null
    /usr/bin/ssh-add;
}
## Source SSH settings, if applicable
if [ -f "${SSH_ENV}" ]; then
    . "${SSH_ENV}" > /dev/null
    #ps ${SSH_AGENT_PID} doesn't work under cywgin
    ps -ef | grep ${SSH_AGENT_PID} | grep ssh-agent$ > /dev/null || {
        start_agent;
    }
else
    start_agent;
fi

## Auto startx in tty3
if [[ -z $DISPLAY ]] && [[ $(tty) = /dev/tty3 ]]; then
	exec startx /etc/X11/Sessions/dwm -- :3 vt3 -nolisten tcp -br ;
fi
