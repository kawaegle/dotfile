#!/bin/zsh

: ${ZSH_TMUX_AUTOSTART:=false}
: ${ZSH_TMUX_AUTOSTART_ONCE:=true}
: ${ZSH_TMUX_AUTOCONNECT:=true}
: ${ZSH_TMUX_AUTOQUIT:=$ZSH_TMUX_AUTOSTART}
: ${ZSH_TMUX_FIXTERM:=true}
: ${ZSH_TMUX_FIXTERM_WITHOUT_256COLOR:=screen}
: ${ZSH_TMUX_FIXTERM_WITH_256COLOR:=screen-256color}
: ${ZSH_TMUX_CONFIG:=$HOME/.tmux.conf}
: ${ZSH_TMUX_UNICODE:=false}

0="${${ZERO:-${0:#$ZSH_ARGZERO}}:-${(%):-%N}}"
0="${${(M)0:#/*}:-$PWD/$0}"

function _zsh_tmux_plugin_run() {
    if [[ -n "$@" ]]; then
        command tmux "$@"
        return $?
    fi

    local -a tmux_cmd
    tmux_cmd=(command tmux)
    [[ "$ZSH_TMUX_UNICODE" == "true" ]] && tmux_cmd+=(-u)

  # Try to connect to an existing session.
  if [[ -n "$ZSH_TMUX_DEFAULT_SESSION_NAME" ]]; then
      [[ "$ZSH_TMUX_AUTOCONNECT" == "true" ]] && $tmux_cmd attach -t $ZSH_TMUX_DEFAULT_SESSION_NAME
  else
      [[ "$ZSH_TMUX_AUTOCONNECT" == "true" ]] && $tmux_cmd attach
  fi

  # If failed, just run tmux, fixing the TERM variable if requested.
  if [[ $? -ne 0 ]]; then
      if [[ "$ZSH_TMUX_FIXTERM" == "true" ]]; then
          tmux_cmd+=(-f "$ZSH_TMUX_CONFIG")
      elif [[ -e "$ZSH_TMUX_CONFIG" ]]; then
          tmux_cmd+=(-f "$ZSH_TMUX_CONFIG")
      fi
      if [[ -n "$ZSH_TMUX_DEFAULT_SESSION_NAME" ]]; then
          $tmux_cmd new-session -s $ZSH_TMUX_DEFAULT_SESSION_NAME
      else
          $tmux_cmd new-session
      fi
  fi

  if [[ "$ZSH_TMUX_AUTOQUIT" == "true" ]]; then
      exit
  fi
}

compdef _tmux _zsh_tmux_plugin_run
alias tmux=_zsh_tmux_plugin_run

if [[ -z "$TMUX" && "$ZSH_TMUX_AUTOSTART" == "true" && -z "$INSIDE_EMACS" && -z "$EMACS" && -z "$VIM" ]]; then
    if [[ "$ZSH_TMUX_AUTOSTART_ONCE" == "false" || "$ZSH_TMUX_AUTOSTARTED" != "true" ]]; then
        export ZSH_TMUX_AUTOSTARTED=true
        _zsh_tmux_plugin_run
    fi
fi
