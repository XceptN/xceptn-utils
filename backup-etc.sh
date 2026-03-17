#!/bin/bash
# Sync /etc into a folder inside your home so Deja Dup picks it up
DEST="/home/$(logname)/Backup/etc-backup"
mkdir -p "$DEST"
rsync -a --delete /etc/ "$DEST/"
chown -R $(logname):$(logname) "$DEST"
