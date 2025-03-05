#!/bin/zsh
# preview:
# [kawaegle@MLP]-[~]
# >>>

ZSH_THEME_GIT_PROMPT_PREFIX=":["
PROMPT='%{$fg[blue]%}%B[%b%{$fg[cyan]%}%n%{$fg[grey]%}%B@%b%{$fg[cyan]%}%m%{$fg[blue]%}%B]-%b%{$fg[blue]%}%B[%b%{$fg[white]%}%~%(`test -d "$PWD"/.git`."$(gitprompt)%{$fg[blue]%}%B]".%{$fg[blue]%})%b
%B%(?.%F{cyan}>>>.%F{red}>>>)%F{reset}%b'
