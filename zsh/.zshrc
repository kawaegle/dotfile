# Manage Env
: ${DOT:="$HOME/.dotfile"}
: ${ZSH_DOT="$DOT/zsh/.local/share/zsh"}
set -a; source $ZSH_DOT/env; set +a
set -a; source $ZSH_DOT/de_env; set +a
set -a; source $ZSH_DOT/jenkins.env; set +a

autoload -U compinit
autoload -U promptinit
autoload -U colors
colors
promptinit
compinit -D

# Load Alias and Plugins
source $ZSH_DOT/alias
setopt auto_cd
for p in "$ZSH_DOT/plugins/"*
do
    source $p
done

# Load Themes from Themes folder
for theme in "$ZSH_DOT/themes/"*
do
    check_theme=${${theme%.zsh}##*/}
    if [[ $ZSH_THEME == "$check_theme" ]]; then
        source $theme
        break
    fi
done

# Completion
setopt correct_all
setopt autocd autopushd
setopt menu_complete
setopt no_list_ambiguous
setopt interactive_comments # maybe remove it so # can be a corrected as sudo
unsetopt beep

zstyle ':completion:*' matcher-list '' 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=*' 'l:|=* r:|=*'
zstyle ':completion:*' file-patterns '^package-lock.json:source-files' '*:all-files' # ignore `package-lock.json` from completion
zstyle ':completion:*:(cp|rm|mv):*' ignore-line yes
zstyle ':completion:*:functions' ignored-patterns '_*' # ignore completion for non-existant commands
zstyle ':completion:*' menu select=0

# Pip completion
function _pip_completion {
    local words cword
    read -Ac words
    read -cn cword
    reply=( $( COMP_WORDS="$words[*]" \
        COMP_CWORD=$(( cword-1 )) \
        PIP_AUTO_COMPLETE=1 $words[1] 2>/dev/null ))
}
compctl -K _pip_completion pip
eval "$(register-python-argcomplete pipx)"

# Vagrant command completion
fpath=(/opt/vagrant/embedded/gems/gems/vagrant-*/contrib/zsh $fpath)

# All ZSH completion
fpath=(/usr/share/zsh/site-functions/ $fpath)

# History option
setopt hist_ignore_all_dups
setopt hist_find_no_dups
setopt share_history
setopt hist_ignore_space
setopt hist_reduce_blanks
autoload -U history-search-end
HISTFILE="$ZSH_DOT/hist"
HISTSIZE=10000
SAVEHIST=10000
zle -N history-beginning-search-backward-end history-search-end
zle -N history-beginning-search-forward-end history-search-end

# Keybind
bindkey "^[[A" history-beginning-search-backward-end
bindkey "^[[B" history-beginning-search-forward-end
bindkey '^[[H' beginning-of-line
bindkey '^[[F' end-of-line
bindkey '^[[3~' delete-char
bindkey '^[[1;5C' forward-word
bindkey '^[[1;5D' backward-word

# Set LS_COLORS.
if [ -x /usr/bin/dircolors ]; then
  test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
fi
if [ -z "$LS_COLORS" ]; then
  zstyle ':completion:*' list-colors 'di=34:ln=35:so=32:pi=33:ex=31:bd=34;46:cd=34;43:su=30;41:sg=30;46:tw=30;42:ow=30;43:'
else
  zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}
fi

# Begin: PlatformIO Core completion support
eval "$(_PIO_COMPLETE=zsh_source pio)"
# End: PlatformIO Core completion support
