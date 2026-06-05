#!/bin/bash
last=""
while true; do
		current=$(xclip -selection clipboard -o 2>/dev/null) || current=""
		if [[ -n "$current" && "$current" != "$last" ]]; then
				printf '%s' "$current" | wl-copy
				last="$current"
		fi
		sleep 0.1
done
