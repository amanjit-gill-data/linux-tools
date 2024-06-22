#!/usr/bin/bash
### BACKUP TO CLOUD STORAGE ###

# ensure backup dirs are defined
source "$HOME/bin/backup_dirs.sh"

# output date and time to mark start of job
date

# specify each included source dir without '/'
rsync -avzd \
  --exclude software/ \
  --exclude venv*/ \
  $HOME/Documents \
  $HOME/Downloads \
  $HOME/Pictures \
  $LISTS \
  backup:x1-yoga

