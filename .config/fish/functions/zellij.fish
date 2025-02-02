function start_or_attach_zellij
    export ZELLIJ_CONFIG_DIR=$HOME/.config/zellij
    export ZELLIJ_AUTO_EXIT=true
    export ZELLIJ_AUTO_ATTACH=true

    if command -q zellij
        if test -z "$ZELLIJ"
            if zellij list-sessions | grep -q Hack
                exec zellij attach Hack
            else
                eval "zellij --session Hack options --default-shell fish"
            end
        end
    end
end

start_or_attach_zellij
