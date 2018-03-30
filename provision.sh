#!/usr/bin/env bash

# Put SDR application software onto a naked raspbian-jessie-lite

set -e
set -u

host=raspberrypi

for i in "$@"
do
case $i in
    -h=*|--host=*)
    host="${i#*=}"
    shift
    ;;
esac
done

# enable only ssh key auth for pi@rpi
echo "Connecting to $host. Default password from ISO is 'raspberry'"
ssh-copy-id pi@$host
scp bootstrap.sh pi@$host:/tmp/bootstrap.sh
ssh pi@$host sudo /bin/bash /tmp/bootstrap.sh
