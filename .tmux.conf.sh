_uname_s=$(uname -s)
os=$(uname | awk '{print tolower($0)}')

_apply_configuration() {
  file=~/.tmux.conf.${os}
  test -f $file && tmux source-file $file
}

_is_enabled() {
  [ x"$1" = x"true" ] || [ x"$1" = x"yes" ] || [ x"$1" = x"enabled" ] || [ x"$1" = x"1" ]
}

_pane_info() {
  pane_pid="$1"
  pane_tty="${2##/dev/}"
  case "$_uname_s" in
    *CYGWIN*)
      ps -al | tail -n +2 | awk -v pane_pid="$pane_pid" -v tty="$pane_tty" '
        ((/ssh/ && !/-W/) || !/ssh/) && !/tee/ && $5 == tty {
          user[$1] = $6; if (!child[$2]) child[$2] = $1
        }
        END {
          pid = pane_pid
          while (child[pid])
            pid = child[pid]

          file = "/proc/" pid "/cmdline"; getline command < file; close(file)
          gsub(/\0/, " ", command)
          "id -un " user[pid] | getline username
          print pid":"username":"command
        }
      '
      ;;
    *Linux*)
      ps -t "$pane_tty" --sort=lstart -o user=XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX -o pid= -o ppid= -o command= | awk -v pane_pid="$pane_pid" '
        ((/ssh/ && !/-W/) || !/ssh/) && !/tee/ {
          user[$2] = $1; if (!child[$3]) child[$3] = $2; pid=$2; $1 = $2 = $3 = ""; command[pid] = substr($0,4)
        }
        END {
          pid = pane_pid
          while (child[pid])
            pid = child[pid]

          print pid":"user[pid]":"command[pid]
        }
      '
      ;;
    *)
      ps -t "$pane_tty" -o user=XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX -o pid= -o ppid= -o command= | awk -v pane_pid="$pane_pid" '
        ((/ssh/ && !/-W/) || !/ssh/) && !/tee/ {
          user[$2] = $1; if (!child[$3]) child[$3] = $2; pid=$2; $1 = $2 = $3 = ""; command[pid] = substr($0,4)
        }
        END {
          pid = pane_pid
          while (child[pid])
            pid = child[pid]

          print pid":"user[pid]":"command[pid]
        }
      '
      ;;
  esac
}

_ssh_or_mosh_args() {
  case "$1" in
    *sshw*)
      read cmd cmd_args <<< "$1"
      if [ -z "$cmd_args" ]; then
        args=" sshw@sshw"
      else
        local ssh_info=$(sshw -G -q $cmd_args 2>/dev/null)
        if [ -n "$ssh_info" ]; then
          local user=$(printf '%s' "$ssh_info" | awk '/^user / { print $2; exit }')
          local host=$(printf '%s' "$ssh_info"| awk '/^hostname / { print $2; exit }')
          args=" $user@$host"
        else
          args=" sshw@sshw"
        fi
      fi
      ;;
    *ssh*)
      args=$(printf '%s' "$1" | perl -n -e 'print if s/.*?\bssh[\w]*\s*((?:\s+-\w+)*)(\s+\w+)(\s\w+)?/\1\2/')
      ;;
    *mosh-client*)
      args=$(printf '%s' "$1" | sed -E -e 's/.*mosh-client -# (.*)\|.*$/\1/' -e 's/-[^ ]*//g' -e 's/\d:\d//g')
      ;;
  esac

 printf '%s' "$args"
}

_username() {
  pane_pid=${1:-$(tmux display -p '#{pane_pid}')}
  pane_tty=${2:-$(tmux display -p '#{b:pane_tty}')}
  ssh_only=$3

  pane_info=$(_pane_info "$pane_pid" "$pane_tty")
  command=${pane_info#*:}
  command=${command#*:}

  ssh_or_mosh_args=$(_ssh_or_mosh_args "$command")
  if [ -n "$ssh_or_mosh_args" ]; then
    # shellcheck disable=SC2086
    username=$(ssh -G $ssh_or_mosh_args 2>/dev/null | awk '/^user / { print $2; exit }')
    # shellcheck disable=SC2086
    [ -z "$username" ] && username=$(ssh $ssh_or_mosh_args -T -o ControlPath=none -o ProxyCommand="sh -c 'echo %%username%% %r >&2'" 2>&1 | awk '/^%username% / { print $2; exit }')
    [ -z "$username" ] && username=$(ssh $ssh_or_mosh_args -v -T -o ControlPath=none -o ProxyCommand=false -o IdentityFile='%%username%%/%r' 2>&1 | awk '/%username%/ { print substr($4,12); exit }')
  else
    if ! _is_enabled "$ssh_only"; then
      username=${pane_info#*:}
      username=${username%%:*}
    fi
  fi

  printf '%s\n' "$username"
}

_hostname() {
  pane_pid=${1:-$(tmux display -p '#{pane_pid}')}
  pane_tty=${2:-$(tmux display -p '#{b:pane_tty}')}
  ssh_only=$3
  full=$4
  h_or_H=$5

  pane_info=$(_pane_info "$pane_pid" "$pane_tty")
  command=${pane_info#*:}
  command=${command#*:}

  ssh_or_mosh_args=$(_ssh_or_mosh_args "$command")
  if [ -n "$ssh_or_mosh_args" ]; then
    # shellcheck disable=SC2086
    hostname=$(ssh -G $ssh_or_mosh_args 2>/dev/null | awk '/^hostname / { print $2; exit }')
    # shellcheck disable=SC2086
    [ -z "$hostname" ] && hostname=$(ssh -T -o ControlPath=none -o ProxyCommand="sh -c 'echo %%hostname%% %h >&2'" $ssh_or_mosh_args 2>&1 | awk '/^%hostname% / { print $2; exit }')

    if ! _is_enabled "$full"; then
      case "$hostname" in
          *[a-z-].*)
              hostname=${hostname%%.*}
              ;;
          127.0.0.1)
              hostname="localhost"
              ;;
      esac
    fi
  else
    if ! _is_enabled "$ssh_only"; then
      hostname="$h_or_H"
    fi
  fi

  printf '%s\n' "$hostname"
}

_root() {
  pane_pid=${1:-$(tmux display -p '#{pane_pid}')}
  pane_tty=${2:-$(tmux display -p '#{b:pane_tty}')}
  root=$3

  username=$(_username "$pane_id" "$pane_tty" false)

  [ x"$username" = x"root" ] && echo "$root"
}

$@
