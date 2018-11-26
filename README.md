
# Compute Cluster

My notes on automating nodes for parallel computing. I use ansible for distribution, after I build an new node and install the base system, I get a dhcp address then I run a playbook from my local machine. Easy.

View the docs folder for more information on setting up ansible, setting up ssh keys and parallels.

## Setup New Node

Copy the ssh key.

`ssh-copy-id -i ./id_rsa admin@172.16.0.174`

Add dhcp address to ssh config.

`vi ~/.ssh/config`

Update your ansible inventory with node name and run playbook.

`ansible-playbook --limit "node00" playbooks/setup_node.yml --extra-vars "new_ip=172.16.0.200" --ask-become-pass`

Update local `~/.ssh/config` to new static ip address. 

## Updating Nodes

Ocassionaly you want to update your nodes

`ansible-playbook playbooks/update_nodes.yml --ask-become-pass`

## Running Parallel

To run the command uptime on remote nodes you can do:

`parallel --tag --nonall -S node00,node01 uptime`

