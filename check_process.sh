#!/bin/bash
# check_process [process name] [start command] <force start flag F>
# e.g. check_process "mysql" "/etc/init.d/mysql start"  # Start if process is not found
# e.g. check_process "mysql" "/etc/inid.d/mysql restart" F  # Force restart
if [ $# -lt 2 ]
then
  echo "Improper Usage: check_process [process name] [start command] <force start flag F>"
  exit 1
fi

if [ "$3" = "F" ]
then
  `pkill $1`
  `$2`
else
  if [ `pgrep -n $1` ]
  then
    echo "`date`: $1 service running, everything is fine!"
  else
    echo "`date`: $1 is not running...starting..."
    `$2`
  fi
fi
