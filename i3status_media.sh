#!/usr/bin/bash
# playerctl and jq should be installed

function add_to_bar {
  echo "$json_array" | jq --argjson arg_j "$1" '[$arg_j] + .'
}

function get_active_player {
  for player in $(/usr/bin/playerctl -l); do
    if [ "$(/usr/bin/playerctl -p "$player" status)" = "Playing" ]; then
      echo "$player"
      break
    fi
  done
}

function format {
  local player=$(get_active_player)

  if [[ -n $player ]]; then
    local _status="$(/usr/bin/playerctl -p "$player" status)"
    local title="$(/usr/bin/playerctl -p "$player"  metadata title)"
    local artist="$(/usr/bin/playerctl -p "$player"  metadata artist)"
  else
    local _status="$(/usr/bin/playerctl status)"
    local title="$(/usr/bin/playerctl metadata title)"
    local artist="$(/usr/bin/playerctl metadata artist)"
  fi

  if [[ $_status == "Playing" ]]; then
    local symbol="▶"
    color="#FFFFFF"
  elif [[ $_status == "Paused" ]]; then
    local symbol="⏸︎"
    color="#808080"
  else
    local symbol=""
    color="#000000"
    echo "{ \"name\": \"media\", \"markup\": \"none\", \"full_text\": \"\" }"
    return
  fi

  if [[ -n "$artist" ]]; then
    local media="$symbol $title, $artist"
  else
    local media="$symbol $title"
  fi

  echo "{ \"name\": \"media\", \"markup\": \"none\", \"full_text\": \"$media\", \"color\": \"$color\" }"
}

read line; echo "$line"
read line; echo "$line"
read line; echo "$line"

json_array="[]"

while :
do
  json_media=$(format)

  read line
  json_array="$(echo $line | sed -e 's/^,//')"
  json_array=$(add_to_bar "$json_media")
  echo ",$json_array"
done
