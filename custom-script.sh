#!/usr/bin/env bash

set -eux

apt-get update -qq
apt-get install -qqy curl
# download the old version of the bootstrap script to play nice with the old salt
curl -s -o /tmp/bootstrap-salt.sh 'https://raw.githubusercontent.com/saltstack/salt-bootstrap/4c2e1bcd56c87493ebd37783db19f88e94e5b444/bootstrap-salt.sh'
# run the bootstrap script and install the crusty 2014.7.5 from github
sh /tmp/bootstrap-salt.sh -P git v2014.7.5
# remove the bootstrap script once we're done with it
rm /tmp/bootstrap-salt.sh

# stop salt-minion service
stop salt-minion
# remove the minion_id so that it can be set by the hostname on future calls
rm /etc/salt/minion_id
# disable automatic starting of minion (so it doesn't set the minion_id again before hostname is updated)
echo manual >> /etc/init/salt-minion.override
