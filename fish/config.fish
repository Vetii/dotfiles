if status is-interactive
and not set -q TMUX
and not test "$TERM" = "dumb"
    exec tmux
end

# OPAM configuration
source /home/noric/.opam/opam-init/init.fish > /dev/null 2> /dev/null or true

# Adding Zotero to the path
if test -e /opt/zotero/zotero
    set PATH /opt/zotero/ $PATH
end

if test -e /home/noric/julia-1.3.1/
    set PATH /home/noric/julia-1.3.1/bin $PATH
end
