#!/bin/bash
set -x

DISK=$1

if test -b "${DISK}"; then
 echo -e -n "do you want to modify \"$DISK\"? (y/N) ";
 read -r YES;
 if [ "$YES" == "Y" ] || [ "$YES" == "y" ]; then
  sudo sgdisk --move-second-header --randomize-guids --disk-guid=R $DISK;
 else exit 0
 fi
else exit -1
fi
