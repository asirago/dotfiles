#!/bin/bash

opacity=$(awk 'NR == 2' ~/.config/alacritty/alacritty.toml)

if [ "$opacity" = "opacity = 0.8" ]; then
    sed -i '' '2s/.*/opacity = 1/' ~/.config/alacritty/alacritty.toml
else
    sed -i '' '2s/.*/opacity = 0.8/' ~/.config/alacritty/alacritty.toml
fi


