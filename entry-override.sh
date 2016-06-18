#!/bin/bash
set -e

if [ -d "$GHOST_CONTENT/themes/$GHOST_THEME" ]; then
    rm -rf "$GHOST_CONTENT/themes/$GHOST_THEME"
fi

if [ -e "$GHOST_CONTENT/config.js" ]; then
    rm "$GHOST_CONTENT/config.js"
fi

exec "/entrypoint.sh" "$@"
