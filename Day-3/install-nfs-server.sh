### install nfs-kernel server
#!/bin/bash

sudo apt-get update
sudo apt-get install -y nfs-kernel-server

## create nfs share directory

sudo mkdir -p /mnt/nfs_share

sudo chown -R nobody:nogroup /mnt/nfs_share/

sudo chmod 777 /mnt/nfs_share/

sudo echo -e "/exports/volumes *(rw,sync,no_root_squash,no_subtree_check)" > /etc/exports

mkdir /exports/volumes

sudo exportfs -a

sudo systemctl restart nfs-kernel-server
