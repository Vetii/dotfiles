if status is-interactive
and not set -q TMUX
    exec tmux
end

alias fullpath 'readlink -f'

# OPAM configuration
source /home/noric/.opam/opam-init/init.fish > /dev/null 2> /dev/null or true
