autoload -U colors && colors
autoload -U compinit
zstyle ':completion:*' menu select
zmodload zsh/complist
compinit
_comp_options+=(globdots)
setopt autocd
setopt interactive_comments

PROMPT='%F{blue}%B%n%b%f at %F{red}%B%m%b%f in %F{green}%B%~%b%f$ '
RPROMPT='%(?..[%F{red}%B%?%b%f]) [%*]'

HISTFILE=$HOME/.zsh_history        # enable history saving on shell exit
HISTSIZE=10000                  # lines of history to maintain memory
SAVEHIST=$HISTSIZE              # lines of history to maintain in history file.
setopt EXTENDED_HISTORY         # save timestamp and runtime information
setopt APPEND_HISTORY           # append rather than overwrite history file.
setopt INC_APPEND_HISTORY       # append to history immediately.
setopt SHARE_HISTORY            # Use the same history file for all sessions

setopt HIST_IGNORE_ALL_DUPS     # ignore all duplication in command history list
# setopt HIST_IGNORE_DUPS        # ignore consecutive duplication in command history list
# setopt HIST_EXPIRE_DUPS_FIRST  # allow dups, but expire old ones when I hit HISTSIZE
setopt HIST_FIND_NO_DUPS
setopt HIST_IGNORE_SPACE        # Do not include lines beginning with a space in the history file
# setopt SINGLE_LINE_ZLE         # single line command history
setopt HIST_VERIFY              # let the user edit the command line after history expansion
setopt NO_HIST_BEEP


# --Settings from bash
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    alias dir='dir --color=auto'
    alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# --Functions from bashrc
man() {
    LESS_TERMCAP_md=$'\e[01;31m' \
    LESS_TERMCAP_me=$'\e[0m' \
    LESS_TERMCAP_se=$'\e[0m' \
    LESS_TERMCAP_so=$'\e[01;44;33m' \
    LESS_TERMCAP_ue=$'\e[0m' \
    LESS_TERMCAP_us=$'\e[01;32m' \
    command man "$@"
}

ex(){
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

fastlatex(){
    pdflatex "$1"
    biber "$(echo $1 | cut -d'.' -f1)"
    pdflatex "$1"
#    zathura "$(echo $1 | cut -d'.' -f1).pdf"
}

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
alias ligplus='java -cp /home/egemen/.local/src/LigPlus/ -jar /home/egemen/.local/src/LigPlus/LigPlus.jar' 
alias feh='feh --scale-down --auto-zoom'

# Alias for BIOVIA Discovery Studio
alias biovia='primusrun /home/egemen/BIOVIA/DiscoveryStudio2021/bin/DiscoveryStudio2021'

# Aliases for my git bare repos.
# alias dotfiles='/usr/bin/git --git-dir=/home/egemen/.dotfiles/ --work-tree=/home/egemen'
alias trdocumentation='/usr/bin/git --git-dir=/home/egemen/Documents/.trdocumentation/ --work-tree=/home/egemen/Documents'
alias debdots='/usr/bin/git --git-dir=/home/egemen/.debdots/ --work-tree=/home/egemen'

# Just for fun:
alias please='sudo'

# --Exports
export PATH="${PATH}:/home/egemen/.local/bin"
export QT_QPA_PLATFORMTHEME=gtk2
# colored GCC warnings and errors
export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'
export RUST_BACKTRACE=1
# to prevent the percentage sign at the end of running C programs
export PRINT_EOL_MARK=''

source ~/.local/src/fast-syntax-highlighting/fast-syntax-highlighting.plugin.zsh
