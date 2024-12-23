#!/bin/bash

BASE="https://raw.githubusercontent.com/BlackIceCrypto/BlackIceGuides/refs/heads/main/base.sh"
source <(curl -s $BASE)
bold=$(tput bold)
normal=$(tput sgr0)

logo


# Set vars
ALIAS_FILE="~/.bash_alias"


# Set aliases
    # System alias
UPDATE_SYS_ALIAS="sudo apt update && sudo apt upgrade -y"
SYSCTL_RESTART="sudo systemctl restart"
SYSCTL_STOP="sudo systemctl stop"
SYSCTL_START="sudo systemctl start"

    # Tmux alias
TMUX_NEW_ALIAS="tmux new -s"
TMUX_ATTACH_ALIAS="tmux a -t"
TMUX_LIST_ALIAS="tmux ls"

    # Docker alias
DOCKER_STOP_ALL="docker stop $(docker ps -aq)"
DOCKER_REMOOVE_ALL="docker rm $(docker ps -aq)"
DOCKER_COMPOSE_START="docker compose up -d"
DOCKER_COMPOSE_STOP="docker compose down"


# Create file for aliases
cat <<EOF >$ALIAS_FILE
    # System alias
alias upd="$UPDATE_SYS_ALIAS"
alias restart="$SYSCTL_RESTART"
alias stop="$SYSCTL_STOP"
alias start="$SYSCTL_START"

    # Tmux alias
alias txn="$TMUX_NEW_ALIAS"
alias txa="$TMUX_ATTACH_ALIAS"
alias txl="$TMUX_LIST_ALIAS"

    # Docker alias
alias docstop="$DOCKER_STOP_ALL"
alias docrem="$DOCKER_REMOOVE_ALL"
alias dcstart="$DOCKER_COMPOSE_START"
alias dcstop="$DOCKER_COMPOSE_STOP"
EOF

echo "" >> ~/.bashrc
echo "# Add aliases by .bash_alias file" >> ~/.bashrc
echo "source $ALIAS_FILE" >> ~/.bashrc