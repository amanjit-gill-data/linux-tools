#!/usr/bin/bash

export BACKUP_ROOT="$HOME/.backup"
export LISTS="$BACKUP_ROOT/software_lists"
export LOG="$BACKUP_ROOT/log.txt"
mkdir -p $LISTS 

# STEP 1. CREATE LISTS OF INSTALLED SOFTWARE

# list of downloaded software 
ls $HOME/Downloads/software/ -ohgRN --group-directories-first > $LISTS/software_downloads.txt

# list of nvim plugins
ls $HOME/.local/share/nvim/site/pack/github/* > $LISTS/nvim_plugins.txt

# apt command history 
cp /var/log/apt/history.log* $LISTS 
gunzip $LISTS/history.log.*.gz 
ls -rt $LISTS/history.log* | xargs cat > $LISTS/apt_history.txt 
rm $LISTS/history.log*

# STEP 2. SYNC TO REMOTE SERVER 

# list each included source dir without '/'
rsync -avzd \
  --exclude software/ \
  --exclude venv*/ \
  $HOME/Documents \
  $HOME/Downloads \
  $HOME/Pictures \
  $LISTS \
  backup:x1-yoga \
  > $LOG 2>&1


