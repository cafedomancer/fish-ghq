function __ghq_cd -d "Change repository"
    set -l COMMAND "command ghq list -p"

    eval "$COMMAND | "(__fzfcmd)" +m $FZF_DEFAULT_OPTS $FZF_CD_OPTS --query \"$fzf_query\"" | read -l select

    if not test -z "$select"
        cd "$select"

        # Remove last token from commandline.
        commandline -t ""
    end

    commandline -f repaint
end
