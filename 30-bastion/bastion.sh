#!/bin/bash
# We are creating 50GB root disk, but only 20GB is partitioned. So we need to extend the partition and then extend the logical volume and finally extend the filesystem.
# sudo lsblk
# df -hT
growpart /dev/nvme0n1 4 
lvextend -r -L+30G /dev/mapper/RootVG-homeVol
xfs_growfs /home

yum install -y yum-utils
yum-config-manager --add-repo https://rpm.releases.hashicorp.com/RHEL/hashicorp.repo
yum -y install terraform