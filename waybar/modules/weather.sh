#!/bin/bash
#
# weather script for waybar
# 
resp=$(curl -s en.wttr.in?format=%t 2>/dev/null | cut -d+ -f2)
echo -e "{\"text\":\""$resp"\"}"
