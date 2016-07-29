#!/bin/sh


devices=$(env | grep DEVICE_ )
for device in $devices; do
  device_ip=$(echo $device | cut -d= -f2 )
  trigger=$(echo $device | cut -d= -f1 | cut -d_ -f2)
  while true; do 
    (ping -q -c 1 -w 1 $device_ip > /dev/null 2>&1 ) && (curl -v -X POST https://maker.ifttt.com/trigger/$trigger/with/key/$IFTT_KEY ; sleep $SLEEP );
  done &
  echo "waiting for $device_ip to be present to trigger $trigger"
done

wait
