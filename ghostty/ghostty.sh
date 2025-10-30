#!/bin/bash

CONFIG="$HOME/.config/ghostty/config"


opacity=$(rg 'background-opacity' $CONFIG | awk -F= '{print $2}' | tr -d '[:space:]')

if [ "$opacity" = "1" ]; then
    new_opacity="0.7"
else
    new_opacity="1"
fi

sed -i '' -E "s/(background-opacity[[:space:]]*=[[:space:]]*)[0-9.]+/\1${new_opacity}/" "$CONFIG"

echo $new_opacity
