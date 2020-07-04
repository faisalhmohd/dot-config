# Path includes
set -gx PATH /snap/bin $PATH

# pyenv config
set -Ux PYENV_ROOT $HOME/.pyenv
set -Ux fish_user_paths $PYENV_ROOT/bin $fish_user_paths
status --is-interactive; and source (pyenv init -|psub)

# VirtualFish
if set -q VIRTUAL_ENV
    echo -n -s (set_color -b blue white) "(" (basename "$VIRTUAL_ENV") ")" (set_color normal) " "
end

# Aliases

# NewsCred
alias nc-vpn="sudo openvpn --config ~/.ssh/config.ovpn"
alias ncd-logs="nc-docker logs -ft"
alias ncd-test-client="nc-docker test marketingplatform client-test --nc-path"
alias ncd-test-server="nc-docker test marketingplatform server-test"
alias ncd-lint="nc-docker test marketingplatform client-eslint --fix && nc-docker test marketingplatform server-eslint --fix"