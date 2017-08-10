#!/usr/bin/env bash

set -eux

apt-get update
apt-get install -y curl
# download the old version of the bootstrap script to play nice with the old salt
curl -s -o /tmp/bootstrap-salt.sh 'https://raw.githubusercontent.com/saltstack/salt-bootstrap/4c2e1bcd56c87493ebd37783db19f88e94e5b444/bootstrap-salt.sh'
# run the bootstrap script and install the crusty 2014.7.5 from github
sh /tmp/bootstrap-salt.sh -P git v2014.7.5

rm /tmp/bootstrap-salt.sh
