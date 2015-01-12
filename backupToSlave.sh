#!/bin/sh

master=p7
id=root
idhost=$id@p8.coexploration.org

logdir=/root
rsync=/usr/bin/rsync
nice=/bin/nice

now=`/bin/date +"%Y-%m-%d_%H:%M"`
tmp=/tmp/backup_$now
rm -f $tmp
date >$tmp

 opts="-avz -e ssh --delete"

 $nice $rsync $opts /home            $idhost:$master             >>$tmp
 $nice $rsync $opts /etc             $idhost:$master             >>$tmp
 $nice $rsync $opts /usr/local/bin   $idhost:$master             >>$tmp

date >>$tmp

