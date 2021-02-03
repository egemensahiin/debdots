if [[ $TERM != "linux" ]]
then
    # Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
    # Initialization code that may require console input (password prompts, [y/n]
    # confirmations, etc.) must go above this block; everything else may go below.
    if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
      source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
    fi
    
    # If you come from bash you might have to change your $PATH.
    # export PATH=$HOME/bin:/usr/local/bin:$PATH
    
    # Path to your oh-my-zsh installation.
    export ZSH="/home/egemen/.oh-my-zsh"
    
    # Set name of the theme to load --- if set to "random", it will
    # load a random theme each time oh-my-zsh is loaded, in which case,
    # to know which specific one was loaded, run: echo $RANDOM_THEME
    # See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
    ZSH_THEME="powerlevel10k/powerlevel10k"
    
    # Set list of themes to pick from when loading at random
    # Setting this variable when ZSH_THEME=random will cause zsh to load
    # a theme from this variable instead of looking in $ZSH/themes/
    # If set to an empty array, this variable will have no effect.
    # ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )
    
    # Uncomment the following line to use case-sensitive completion.
    # CASE_SENSITIVE="true"
    
    # Uncomment the following line to use hyphen-insensitive completion.
    # Case-sensitive completion must be off. _ and - will be interchangeable.
    # HYPHEN_INSENSITIVE="true"
    
    # Uncomment the following line to disable bi-weekly auto-update checks.
    # DISABLE_AUTO_UPDATE="true"
    
    # Uncomment the following line to automatically update without prompting.
    # DISABLE_UPDATE_PROMPT="true"
    
    # Uncomment the following line to change how often to auto-update (in days).
    # export UPDATE_ZSH_DAYS=13
    
    # Uncomment the following line if pasting URLs and other text is messed up.
    # DISABLE_MAGIC_FUNCTIONS="true"
    
    # Uncomment the following line to disable colors in ls.
    # DISABLE_LS_COLORS="true"
    
    # Uncomment the following line to disable auto-setting terminal title.
    # DISABLE_AUTO_TITLE="true"
    
    # Uncomment the following line to enable command auto-correction.
    # ENABLE_CORRECTION="true"
    
    # Uncomment the following line to display red dots whilst waiting for completion.
    # COMPLETION_WAITING_DOTS="true"
    
    # Uncomment the following line if you want to disable marking untracked files
    # under VCS as dirty. This makes repository status check for large repositories
    # much, much faster.
    # DISABLE_UNTRACKED_FILES_DIRTY="true"
    
    # Uncomment the following line if you want to change the command execution time
    # stamp shown in the history command output.
    # You can set one of the optional three formats:
    # "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
    # or set a custom format using the strftime function format specifications,
    # see 'man strftime' for details.
    # HIST_STAMPS="mm/dd/yyyy"
    
    # Would you like to use another custom folder than $ZSH/custom?
    # ZSH_CUSTOM=/path/to/new-custom-folder
    
    # Which plugins would you like to load?
    # Standard plugins can be found in $ZSH/plugins/
    # Custom plugins may be added to $ZSH_CUSTOM/plugins/
    # Example format: plugins=(rails git textmate ruby lighthouse)
    # Add wisely, as too many plugins slow down shell startup.
    plugins=(git debian colorize dirhistory zsh-autosuggestions compleat)
    apt_pref=aptitude
    apt_upgr=safe-upgrade
    
    source $ZSH/oh-my-zsh.sh
    
    # User configuration
    
    # export MANPATH="/usr/local/man:$MANPATH"
    
    # You may need to manually set your language environment
    # export LANG=en_US.UTF-8
    
    # Preferred editor for local and remote sessions
    # if [[ -n $SSH_CONNECTION ]]; then
    #   export EDITOR='vim'
    # else
    #   export EDITOR='mvim'
    # fi
    
    # Compilation flags
    # export ARCHFLAGS="-arch x86_64"
    
    # Set personal aliases, overriding those provided by oh-my-zsh libs,
    # plugins, and themes. Aliases can be placed here, though oh-my-zsh
    # users are encouraged to define aliases within the ZSH_CUSTOM folder.
    # For a full list of active aliases, run `alias`.
    #
    # Example aliases
    # alias zshconfig="mate ~/.zshrc"
    # alias ohmyzsh="mate ~/.oh-my-zsh"
    
    # To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
    [[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
else
    # Path to your oh-my-zsh installation.
    export ZSH="/home/egemen/.oh-my-zsh"
    plugins=(git debian colorize dirhistory zsh-autosuggestions compleat)
    apt_pref=aptitude
    apt_upgr=safe-upgrade
    
    source $ZSH/oh-my-zsh.sh
    PROMPT='%n@%m:%~$ '
    RPROMPT='[%*]'
fi

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

# Just for fun:
alias please='sudo'

# --Exports
export PATH="${PATH}:/home/egemen/.local/bin:/home/egemen/.local/src/clevo-keyboard-backlight-control"
export QT_QPA_PLATFORMTHEME=gtk2
# colored GCC warnings and errors
export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'
export RUST_BACKTRACE=1
