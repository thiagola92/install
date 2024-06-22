#!/bin/bash

crontab <<EOF
0 0 * * * eval upnpc -l | grep ZeroTier/ | sed -e 's/.* \(.*\)->.*/\1 udp/' | xargs -L 1 upnpc -d
EOF
