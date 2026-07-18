#!/usr/bin/env python3

import json
import re
import sys
from pathlib import Path

OUTPUT = Path.home() / ".config/wallust/schemes"


def clean(value):
    if not value:
        return None

    return (
        value
        .replace("#", "")
        .replace('"', "")
        .replace("'", "")
        .upper()
    )


def find_color(text, aliases):
    for alias in aliases:
        patterns = [
            rf"\({alias}\s+['\"]?#?([0-9a-fA-F]{{6}})",
            rf"{alias}\s+['\"]?#?([0-9a-fA-F]{{6}})",
            rf"{alias}[^#\n]*#([0-9a-fA-F]{{6}})",
        ]

        for pattern in patterns:
            match = re.search(
                pattern,
                text,
                re.IGNORECASE
            )

            if match:
                return clean(match.group(1))

    return None


def extract_name(text, filename):
    match = re.search(
        r"\(deftheme\s+([^\s\)]+)",
        text
    )

    name = match.group(1) if match else filename.stem

    return (
        name
        .removeprefix("doom-")
        .removesuffix("-theme")
        .lower()
    )


def different(value, reference, alternatives):
    if value and value != reference:
        return value

    for alt in alternatives:
        if alt and alt != reference:
            return alt

    return "FFFFFF"


def convert(path):

    text = path.read_text(errors="ignore")
    name = extract_name(text, path)

    c = {}

    mappings = {
        "background": [
            "bg",
            "background",
            "base00",
        ],

        "foreground": [
            "fg",
            "foreground",
            "base05",
        ],

        "bright": [
            "base8",
            "white",
            "cream",
            "base07",
            "base06",
        ],

        "red": [
            "red",
            "base08",
        ],

        "orange": [
            "orange",
            "base09",
        ],

        "yellow": [
            "yellow",
            "base0A",
        ],

        "green": [
            "green",
            "base0B",
        ],

        "cyan": [
            "cyan",
            "teal",
            "base0C",
        ],

        "blue": [
            "blue",
            "base0D",
        ],

        "magenta": [
            "magenta",
            "violet",
            "base0E",
        ],

        "comment": [
            "grey",
            "gray",
            "comment",
            "base03",
        ],
    }


    for key, aliases in mappings.items():
        c[key] = find_color(text, aliases)


    # Required wallust values

    if c["background"] is None:
        c["background"] = "000000"

    if c["foreground"] is None:
        c["foreground"] = c["bright"]

    if c["bright"] is None:
        c["bright"] = c["foreground"]


    # Prevent foreground/background collision

    c["foreground"] = different(
        c["foreground"],
        c["background"],
        [
            c["bright"],
            c["comment"],
            "FFFFFF",
        ],
    )


    c["bright"] = different(
        c["bright"],
        c["background"],
        [
            c["foreground"],
            "FFFFFF",
        ],
    )


    # Fill missing ANSI colors

    for key in [
        "red",
        "orange",
        "yellow",
        "green",
        "cyan",
        "blue",
        "magenta",
        "comment",
    ]:
        if c[key] is None:
            c[key] = c["foreground"]


    palette = {
        "background": f"#{c['background']}",
        "foreground": f"#{c['foreground']}",
        "cursor": f"#{c['bright']}",

        "color0": f"#{c['background']}",
        "color1": f"#{c['red']}",
        "color2": f"#{c['green']}",
        "color3": f"#{c['yellow']}",
        "color4": f"#{c['blue']}",
        "color5": f"#{c['magenta']}",
        "color6": f"#{c['cyan']}",
        "color7": f"#{c['foreground']}",

        "color8": f"#{c['comment']}",
        "color9": f"#{c['red']}",
        "color10": f"#{c['green']}",
        "color11": f"#{c['yellow']}",
        "color12": f"#{c['blue']}",
        "color13": f"#{c['magenta']}",
        "color14": f"#{c['cyan']}",
        "color15": f"#{c['bright']}",

        "name": name,
    }


    OUTPUT.mkdir(
        parents=True,
        exist_ok=True
    )

    outfile = OUTPUT / f"{name}.json"

    outfile.write_text(
        json.dumps(
            palette,
            indent=2
        ) + "\n"
    )

    print(f"Created {outfile}")


def main():

    if len(sys.argv) < 2:
        print(
            "Usage: doom-to-base16.py theme.el ..."
        )
        sys.exit(1)

    for filename in sys.argv[1:]:
        convert(Path(filename))


if __name__ == "__main__":
    main()
