PATH="$HOME/local/bin:/usr/local/bin:$PATH"

## handle ssh connections
if [ -n "$SSH_CLIENT" ] || [ -n "$SSH_TTY" ]
then
  session_names=()
  while IFS=: read -r session_name _; do session_names+=("$session_name"); done < <(tmux -S ~/.tmux.socket list-sessions)

  if [[ "${#session_names[@]}" -eq 1 ]]
  then
    exec tmux -S ~/.tmux.socket attach -t ${session_names[0]}
  else
    for i in "${!session_names[@]}"; do
      printf "[%s] %s  " "$((i+1))" "${session_names[$i]}"
    done

    printf "\nEnter the number of the tmux session to join: "

    read session

    exec tmux -S ~/.tmux.socket attach -t ${session_names[$((session-1))]}
  fi
fi

# default editor
EDITOR=vim

# activate erlang
. $HOME/local/otp/otp-17.4/activate
