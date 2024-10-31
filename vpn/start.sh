#!/bin/bash

if [ -z "$1" ] || [ -z "$2" ]; then
    echo "Usage: $0 <password_path_in_pass> <template_path>"
    exit 1
fi

PASSWORD=$(pass "$1")
TEMPLATE_PATH=$2

CONFIG_FILE=$(mktemp)
chmod 600 "$CONFIG_FILE"

PASSWORD=$(printf '%s\n' "$PASSWORD" | sed 's/[&/\]/\\&/g')
sed "s/<PASSWORD>/$PASSWORD/" "$TEMPLATE_PATH" > "$CONFIG_FILE"
#cat "$CONFIG_FILE"

sudo openfortivpn -c "$CONFIG_FILE"

rm -f "$CONFIG_FILE"
