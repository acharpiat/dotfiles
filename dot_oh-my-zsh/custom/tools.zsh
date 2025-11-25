# https://serverfault.com/questions/3743/what-useful-things-can-one-add-to-ones-bashrc
extract () {
    if [ -f $1 ] ; then
        case $1 in
            *.tar.bz2)   tar xvjf $1    ;;
            *.tar.gz)    tar xvzf $1    ;;
            *.bz2)       bunzip2 $1     ;;
            *.rar)       unrar x $1     ;;
            *.gz)        gunzip $1      ;;
            *.tar)       tar xvf $1     ;;
            *.tbz2)      tar xvjf $1    ;;
            *.tgz)       tar xvzf $1    ;;
            *.zip)       unzip $1       ;;
            *.Z)         uncompress $1  ;;
            *.7z)        7z x $1        ;;
            *)           echo "don't know how to extract '$1'..." ;;
        esac
    else
        echo "'$1' is not a valid file!"
    fi
}

if command -v explorer.exe >/dev/null; then
    function explorer(){
        p="${1:=.}"
        wp="$(wslpath -w $p)"
        explorer.exe "$wp"
    }
fi

# atuin - Magical shell history
# https://github.com/ellie/atuin
if command -v atuin &>/dev/null; then
    # Prevent the up arrow rebind
    export ATUIN_NOBIND="true"
    eval "$(atuin init zsh)"
    bindkey '^r' _atuin_search_widget

    # depends on terminal mode - up arrow
    #bindkey '^[[A' _atuin_search_widget
    #bindkey '^[OA' _atuin_search_widget
fi

cg () {
 code -rg "$(sed -r 's|:$||'<<<"$1")"
}
