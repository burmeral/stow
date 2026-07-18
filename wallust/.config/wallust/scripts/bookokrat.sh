#!/usr/bin/env bash

CONFIG="$HOME/.config/bookokrat/config.yaml"
GENERATED="$HOME/.config/bookokrat/generated-theme.yaml"

python3 <<EOF
from pathlib import Path

config = Path("$CONFIG").read_text()
theme = Path("$GENERATED").read_text()

start = "# BEGIN WALLUST THEME"
end = "# END WALLUST THEME"

block = f"{start}\n{theme}\n{end}"

if start in config:
    before = config.split(start)[0]
    after = config.split(end)[1]
    config = before + block + after
else:
    config += "\n\n" + block

Path("$CONFIG").write_text(config)
EOF
