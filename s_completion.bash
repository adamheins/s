# Directly adapted from <https://stackoverflow.com/a/62980925>
_s()
{
    local cmd=$1 cur=$2 pre=$3
    local arr i file

    arr=( $( cd "$S_DIR" && compgen -f -- "$cur" ) )
    COMPREPLY=()
    for ((i = 0; i < ${#arr[@]}; ++i)); do
        file=${arr[i]}
        if [[ -d $S_DIR/$file ]]; then
            file=$file/
        fi
        COMPREPLY[i]=$file
    done
}
complete -F _s -o nospace s
