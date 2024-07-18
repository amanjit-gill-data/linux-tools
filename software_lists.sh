#!/usr/bin/bash
### CREATE LISTS OF INSTALLED SOFTWARE ### 

# ensure backup dirs are defined
source "$HOME/bin/backup_dirs.sh"

# note that software list update has been triggered 
echo "update of software lists triggered"

# list of downloaded software 
ls $HOME/Downloads/software/ -ohgRN --group-directories-first > $LISTS/software_downloads.txt

# list of nvim plugins
ls $HOME/.local/share/nvim/site/pack/github/* > $LISTS/nvim_plugins.txt

# apt command history 
cp /var/log/apt/history.log* $LISTS 
gunzip $LISTS/history.log.*.gz 
ls -rt $LISTS/history.log* | xargs cat > $LISTS/apt_history.txt 
rm $LISTS/history.log*

