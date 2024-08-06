#!/usr/bin/bash
### BACKUP TO CLOUD STORAGE ###

# ensure backup dirs are defined
source "$HOME/bin/backup_dirs.sh"

# output date and time to mark start of job
date

# specify each included source dir without '/'
# -a: archive, ensures recursive 
# -v: verbose 
# -z: compress transmission
# --delete: delete dest files that no longer exist at source 
rsync -avz \
  --exclude software/ \
  --exclude venv*/ \
  --delete \
  $HOME/Documents \
  $HOME/Downloads \
  $HOME/Pictures \
  $HOME/Videos \
  $LISTS \
  backup:x1-yoga

