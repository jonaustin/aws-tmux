#!/usr/bin/env bash

CURRENT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}"  )" && pwd  )"
AWS_TMUX_BINARY="${AWS_TMUX_BINARY:-aws}"
source "$CURRENT_DIR/helpers.sh"

get_account()
{
  AWS_ACCOUNT="$(${AWS_TMUX_BINARY} aws sts get-caller-identity | jq -cr '.Account' 2>/dev/null)"
  if [[ $AWS_ACCOUNT == "" ]]; then
    printf "not set"
  else 
    printf "$AWS_ACCOUNT"
  fi
}
get_account
