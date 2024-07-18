#!/usr/bin/bash 
### HOURLY ANACRON CHECK ###

date
echo "check daily jobs"

/usr/sbin/anacron -s -t $HOME/.anacron/etc/anacrontab -S $HOME/.anacron/spool

