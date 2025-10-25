if (($ + commands[onefetch])); then
  last_repository=""
  check_directory_for_new_repository() {

local current_repository
current_repository=$(git rev-parse --show-toplevel 2>/dev/null) || current_repository=""

  if [[ -n $current_repository && $current_repository != $last_repository ]]; then
    if command -v onefetch >/dev/null 2>&1 && git -C "$current_repository" rev-list -n 1 --all >/dev/null 2>&1; then
      # Optional: if HEAD is unborn, pick the first commit on any branch
      if ! git -C "$current_repository" rev-parse --verify HEAD >/dev/null 2>&1; then
        # HEAD is unborn; just skip to avoid onefetch error
        :
      else
        onefetch
      fi
    fi
  fi



    last_repository=$current_repository
  }

  if (($ + commands[zoxide])); then

    function cd() {
      z "$@"
      check_directory_for_new_repository

    }
  else
    function cd() {
      cd "$@"
      check_directory_for_new_repository

    }
  fi

fi

# todo add macchina neofetch caching and fix function
