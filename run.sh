#!/bin/bash

pid_file=$1/$1.pid
# Kill if process is already running
if [ -e $pid_file ]
then
        pkill -TERM -P `cat $pid_file`
fi

# Empty folder

rm -rf $1

# Extract artifact

mkdir $1
tar xvzf $1.tar.gz -C $1

# Launch in background

./$1/run.sh &
echo $! > $pid_file

