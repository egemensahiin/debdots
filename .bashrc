# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# Auto cd when write a valid directory name.
shopt -s autocd 

# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

# non zero status function for prompt
nonzero_return() {
	RETVAL=$?
	[ $RETVAL -ne 0 ] && echo "[${RETVAL}]"
}

# extraction function from manjaro configuration
ex ()
{
  if [ -f $1 ] ; then
    case $1 in
      *.tar.bz2)   tar xjf $1   ;;
      *.tar.gz)    tar xzf $1   ;;
      *.bz2)       bunzip2 $1   ;;
      *.rar)       unrar x $1     ;;
      *.gz)        gunzip $1    ;;
      *.tar)       tar xf $1    ;;
      *.tbz2)      tar xjf $1   ;;
      *.tgz)       tar xzf $1   ;;
      *.zip)       unzip $1     ;;
      *.Z)         uncompress $1;;
      *.7z)        7z x $1      ;;
      *)           echo "'$1' cannot be extracted via ex()" ;;
    esac
  else
    echo "'$1' is not a valid file"
  fi
}

# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=2000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# If set, the pattern "**" used in a pathname expansion context will
# match all files and zero or more directories and subdirectories.
#shopt -s globstar

# make less more friendly for non-text input files, see lesspipe(1)
#[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "${debian_chroot:-}" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    xterm-color|*-256color) color_prompt=yes;;
esac

# uncomment for a colored prompt, if the terminal has the capability; turned
# off by default to not distract the user: the focus in a terminal window
# should be on the output of commands, not on the prompt
#force_color_prompt=yes

if [ -n "$force_color_prompt" ]; then
    if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
	# We have color support; assume it's compliant with Ecma-48
	# (ISO/IEC-6429). (Lack of such support is extremely rare, and such
	# a case would tend to support setf rather than setaf.)
	color_prompt=yes
    else
	color_prompt=
    fi
fi

# i like my hostname symbolized with the distro icon
case $HOSTNAME in
		debian) host=" ";;
		?) host=$HOSTNAME ;;
esac

if [ "$color_prompt" = yes ]; then
    PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u\[\033[00m\] at \[\033[01;31m\]${host}\[\033[00m\]:\[\033[32m\]\w\[\e[31m\]$(nonzero_return)\[\033[00m\]\$\[\033[00m\] '
else
    PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
fi
unset color_prompt force_color_prompt

# If this is an xterm set the title to user@host:dir
case "$TERM" in
xterm*|rxvt*)
    PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1"
    ;;
*)
    ;;
esac

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    alias dir='dir --color=auto'
    alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# some more ls aliases
#alias ll='ls -l'
#alias la='ls -A'
#alias l='ls -CF'

# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

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

# colorized man command. I don't remember it's source
man() {
    LESS_TERMCAP_md=$'\e[01;31m' \
    LESS_TERMCAP_me=$'\e[0m' \
    LESS_TERMCAP_se=$'\e[0m' \
    LESS_TERMCAP_so=$'\e[01;44;33m' \
    LESS_TERMCAP_ue=$'\e[0m' \
    LESS_TERMCAP_us=$'\e[01;32m' \
    command man "$@"
}

# --Exports
export PATH="${PATH}:/home/egemen/.local/bin"
export QT_QPA_PLATFORMTHEME=gtk2
# colored GCC warnings and errors
export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'

# --Aliases
# Aliases for some commands
alias cp="cp -i"                          # confirm before overwriting something
alias df='df -h'                          # human-readable sizes
alias free='free -m'                      # show sizes in MB
alias np='nano -w PKGBUILD'
alias more=less
alias ls='ls --color=auto'
alias ll='ls -lh --color=auto'
alias lla='ls -lah --color=auto'
alias grep='grep --colour=auto'
alias egrep='egrep --colour=auto'
alias fgrep='fgrep --colour=auto'
alias setwp='feh --bg-scale ~/Pictures/wallpapers/wallp1.png'
alias p='sudo pacman'
alias v='vim'
alias sv='sudo vim'
alias shutdown='sudo shutdown'
alias reboot='sudo reboot'

# Aliases for Autodock suite
alias pmv='/home/egemen/Docking/MGLTools-1.5.7/bin/pmv'
alias adt='/home/egemen/Docking/MGLTools-1.5.7/bin/adt'
alias vision='/home/egemen/Docking/MGLTools-1.5.7/bin/vision'
alias pythonsh='/home/egemen/Docking/MGLTools-1.5.7/bin/pythonsh'
alias raccoon='/home/egemen/Docking/MGLTools-1.5.7/bin/raccoon'    
alias adfr='/home/egemen/Docking/ADFRsuite-1.0/bin/adfr'
alias agfr='/home/egemen/Docking/ADFRsuite-1.0/bin/agfr'
alias agfrgui='/home/egemen/Docking/ADFRsuite-1.0/bin/agfrgui'
alias autosite='/home/egemen/Docking/ADFRsuite-1.0/bin/autosite'
alias flipdock='pythonsh /home/egemen/Docking/MGLTools-1.5.7/MGLToolsPckgs/AutoDockFR/bin/runadfr.py'
alias prepare_ligand='/home/egemen/Docking/ADFRsuite-1.0/bin/prepare_ligand'
alias prepare_receptor='/home/egemen/Docking/ADFRsuite-1.0/bin/prepare_receptor'
alias adcp='/home/egemen/Docking/ADFRsuite-1.0/bin/adcp'

# Aliases for my git bare repos.
# alias dotfiles='/usr/bin/git --git-dir=/home/egemen/.dotfiles/ --work-tree=/home/egemen'
alias trdocumentation='/usr/bin/git --git-dir=/home/egemen/Documents/.trdocumentation/ --work-tree=/home/egemen/Documents'
alias debdots='/usr/bin/git --git-dir=/home/egemen/.debdots/ --work-tree=/home/egemen'
