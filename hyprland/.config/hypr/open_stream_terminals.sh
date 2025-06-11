#!/usr/bin/env zsh

source ./layout_functions.sh

hyprctl dispatch workspace t

open_terminal "wezterm_tmux"
open_terminal "wezterm_sergeant"
open_terminal "wezterm_cam"
open_terminal "wezterm_keyboard"
sleep $delay

source ./fix_stream_layout.sh
