source_catkin_ws() {
  # start with pwd without trailing slash
  local dir=${PWD%/}

  while [ -n "$dir" ]; do
    if [ -f "$dir/devel/setup.bash" ]; then
      source "$dir/devel/setup.bash"
      echo "Sourced $dir/devel/setup.bash"
      break
    fi
    # remove everything after and including last slash (i.e. go up one dir)
    dir=${dir%/*}
    if [ -z "$dir" ]; then
      echo "Not in catkin workspace."
    fi
  done
}

source_catkin_ws
