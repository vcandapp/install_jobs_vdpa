#!/bin/bash

set -ex

OPT="-o StrictHostKeyChecking=no -o UserKnownHostsFile=/dev/null"

scp $OPT osp/scripts/baremetal_configure_remote.sh root@${server}:/root/
CMD="bash /root/baremetal_configure_remote.sh"
ssh $OPT root@${server} "echo ${CMD}>>/root/auto-cmd-history"
ssh $OPT root@${server} ${CMD}
