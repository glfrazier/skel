# A test to see if we are launching X. If we are,
# then do not authenticate to the ssh-agent.
#
(cat /proc/$$/cmdline; echo) 2>&1 | grep xinit > /dev/null
launching_X=$?

if [[ $- =~ .*i.* && $launching_X != 0 ]]; then
   if ps -u $UID | grep -v grep | grep ssh-agent >& /dev/null ; then
      pid=`ps -u $UID | grep -v grep | grep ssh-agent | awk '{print $1;}'`
      export SSH_AUTH_SOCK=`/bin/cat /tmp/SSH_AUTH_SOCK`
      export SSH_AGENT_PID=`/bin/cat /tmp/SSH_AGENT_PID`
      ssh-add
   else
      echo launching new agent
      /bin/rm -rf /tmp/ssh-*
      eval `ssh-agent -s`
      echo $SSH_AUTH_SOCK > /tmp/SSH_AUTH_SOCK
      echo $SSH_AGENT_PID > /tmp/SSH_AGENT_PID
      ssh-add
   fi
fi

# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/bin" ] ; then
    PATH="$HOME/bin:$PATH"
fi
if [ -d "$HOME/scripts" ] ; then
    PATH="$HOME/scripts:$PATH"
fi
PATH="$PATH:/cygdrive/c/Program Files (x86)/Graphviz2.38/bin"
export LANGUAGE="en_US:en"
export LC_MESSAGES="en_US.UTF-8"
export LC_CTYPE="en_US.UTF-8"
export LC_COLLATE="en_US.UTF-8"

color1=35
color2=34
PS1="\[\033[1;${color1}m\]\h:\[\033[1;${color2}m\]\w\n\[\033[1;${color1}m\]\$\[\033[0m\] "

# Don't wait for job termination notification
set -o notify

# Don't use ^D to exit
set -o ignoreeof

# Use case-insensitive filename globbing
# shopt -s nocaseglob

# Make bash append rather than overwrite the history on disk
shopt -s histappend

# Send hangup signal to background jobs when logging out
# shopt -s huponexit


# Completion options
# ##################

# These completion tuning parameters change the default behavior of bash_completion:

# Define to access remotely checked-out files over passwordless ssh for CVS
# COMP_CVS_REMOTE=1

# Define to avoid stripping description in --option=description of './configure --help'
# COMP_CONFIGURE_HINTS=1

# Define to avoid flattening internal contents of tar files
# COMP_TAR_INTERNAL_PATHS=1

# If this shell is interactive, turn on programmable completion enhancements.
# Any completions you add in ~/.bash_completion are sourced last.
# case $- in
#   *i*) [[ -f /etc/bash_completion ]] && . /etc/bash_completion ;;
# esac


# History Options
# ###############

# Don't put duplicate lines in the history.
# export HISTCONTROL="ignoredups"

# Ignore some controlling instructions
# HISTIGNORE is a colon-delimited list of patterns which should be excluded.
# The '&' is a special pattern which suppresses duplicate entries.
# export HISTIGNORE=$'[ \t]*:&:[fb]g:exit'
# export HISTIGNORE=$'[ \t]*:&:[fb]g:exit:ls' # Ignore the ls command as well

# Whenever displaying the prompt, write the previous line to disk
# export PROMPT_COMMAND="history -a"

# How much history to remember
export HISTFILESIZE=1500


# Aliases
# #######

# Some example alias instructions
# If these are enabled they will be used instead of any instructions
# they may mask.  For example, alias rm='rm -i' will mask the rm
# application.  To override the alias instruction use a \ before, ie
# \rm will call the real rm not the alias.

# Interactive operation...
# alias rm='rm -i'
# alias cp='cp -i'
# alias mv='mv -i'

# Default to human readable figures
# alias df='df -h'
# alias du='du -h'

# Misc :)
# alias less='less -r'                          # raw control characters
# alias whence='type -a'                        # where, of a sort
# alias grep='grep --color'                     # show differences in colour

# Some shortcuts for different directory listings
# alias ls='ls -hF --color=tty'                 # classify files in colour
# alias dir='ls --color=auto --format=vertical'
# alias vdir='ls --color=auto --format=long'
# alias ll='ls -l'                              # long list
# alias la='ls -A'                              # all but . and ..
alias ls='ls -F'
alias hi=history
alias x='pushd'
alias xx='pushd +2'
alias xxx='pushd +3'
alias X='popd'
alias d=dirs
alias ql="qstat | wc -l"
alias gn='ssh -CY glfrazier@apg05.apogee-research.com "gnome-terminal -x bash -l" < /dev/null'
alias ssh01="ssh -CY -i ~/mvee-test/performance-provisioning/ssh/cfar_tester.rsa cfar_tester@cfartest01.apogee-research.com"
alias ssh02="ssh -CY -i ~/mvee-test/performance-provisioning/ssh/cfar_tester.rsa cfar_tester@cfartest02.apogee-research.com"
alias ssh03="ssh -CY -i ~/mvee-test/performance-provisioning/ssh/cfar_tester.rsa cfar_tester@cfartest03.apogee-research.com"
alias ssh04="ssh -CY -i ~/mvee-test/performance-provisioning/ssh/cfar_tester.rsa cfar_tester@cfartest04.apogee-research.com"
ssh04="ssh -CY -i ~/mvee-test/performance-provisioning/ssh/cfar_tester.rsa cfar_tester@cfartest04.apogee-research.com"
alias scp04="scp -i ~/mvee-test/performance-provisioning/ssh/cfar_tester.rsa"

# cause less to use vi when editing
#
export VISUAL=vi

#
# Project-specific environment variables
####################################
export DOWNLOADS=/cygdrive/c/Users/gfrazier/Downloads

# Functions
# #########

# Some example functions
# function settitle() { echo -ne "\e]2;$@\a\e]1;$@\a"; }

export nuc6=172.10.0.117
export MVEE_ARTIFACT_DIR=/cygwin64/home/gfrazier/mvee-test/artifacts
