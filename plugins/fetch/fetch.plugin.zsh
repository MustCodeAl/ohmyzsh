if (($ + commands[onefetch])); then
  last_repository=""
  check_directory_for_new_repository() {
    current_repository=$(git rev-parse --show-toplevel 2>/dev/null)

    if [ "$current_repository" ] &&
      [ "$current_repository" != "$last_repository" ]; then
      onefetch
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
