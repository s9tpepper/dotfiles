#!/usr/bin/env zsh

delay=0.5

function open_terminal {
  local window_name=$1
  hyprctl dispatch exec "wezterm start --class $window_name"
  sleep $delay
}

function get_address {
  local window_name=$1
  local addr=$(hyprctl clients -j | jq -r --arg win_name "$window_name" '.[] | select(.class == $win_name) | .address')

  echo $addr
}

function is_floating {
  local window_name=$1
  local addr=$(get_address $window_name)
  local floating=$(hyprctl clients -j | jq -r --arg addr "$addr" '.[] | select(.address == $addr) | .floating')

  echo $floating
}

function resize {
  local window_name=$1
  local address=$(get_address $window_name)
  local width=$2
  local height=$3
  hyprctl dispatch resizewindowpixel exact $width $height,address:$address
}

function enable_floating {
  local window_name=$1
  local address=$(get_address $window_name)
  local is_floating=$(is_floating $window_name)

  if [ "$is_floating" = "false" ]; then
    hyprctl dispatch togglefloating address:$address
  fi
}

function move_to {
  local window_name=$1
  local x=$2
  local y=$3
  local address=$(get_address $window_name)

  hyprctl dispatch movewindowpixel exact $x $y,address:$address
}
