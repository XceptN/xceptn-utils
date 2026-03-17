#!/bin/bash
# Sync /etc into a folder inside your home so Deja Dup picks it up
USER_NAME="oyuksel"
DEST="/home/${USER_NAME}/Backup/etc-backup"
mkdir -p "$DEST"
rsync -a --delete /etc/ "$DEST/"
chown -R "${USER_NAME}:${USER_NAME}" "$DEST"
