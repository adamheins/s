# easily source Python virtual environments
curdir=$(pwd)
while [ -n "$curdir" ]; do
  # check if there is a venv here
  if [ -f "$curdir"/.venv/bin/activate ]; then
    source "$curdir"/.venv/bin/activate
    echo "sourced $curdir/.venv/bin/activate"
    break
  else
    # otherwise keep walking up the directory tree
    curdir=${curdir%/*}
  fi
done
