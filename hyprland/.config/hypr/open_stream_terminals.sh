#!/usr/bin/env zsh

source "/home/s9tpepper/.config/hypr/layout_functions.sh"

hyprctl dispatch workspace name:t

open_terminal "wezterm_tmux"
open_terminal "wezterm_sergeant"
open_terminal "wezterm_cam"
open_terminal "wezterm_keyboard"
sleep $delay

source "/home/s9tpepper/.config/hypr/fix_stream_layout.sh"
