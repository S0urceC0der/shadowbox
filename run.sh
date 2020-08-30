#!/bin/bash

catch_signal_term () {
  echo "SIGTERM signal catched"
  veracrypt -d
  echo "Exiting"
  exit 0
}
catch_signal () {
  echo "Ctrl+C signal catched"
  veracrypt -d
  echo "Exiting"
  exit 0
}
catch_signal_kill () {
  echo "Ctrl+C signal catched"
  veracrypt -d
  echo "Exiting"
  exit 0
}

trap 'catch_signal' SIGINT
trap 'catch_signal_term' SIGTERM
trap 'catch_signal_kill' SIGKILL
echo "Waiting..."
# tail -f /dev/null
while true; do
    sleep 1
done