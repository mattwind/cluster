
# Automate parallel nodes

My notes on setting up a network with ansible for parallel computing. I use Debian locally and setup a bunch of Centos 7.5 nodes.
After I build an new node and install the base system, I get a dhcp address then I run a playbook from my local machine using Ansible.

View the docs folder for more information on setting up ansible and ssh keys.

## Prepare a new node

Copy node ssh key to your node.

`ssh-copy-id -i ./id_rsa admin@172.16.0.174`

Add info to your local ssh config.

`vi ~/.ssh/config`

Update your Ansible inventory.

Specify the ansible host defined in your inventory and set the new ip you want the node to be.

`ansible-playbook --limit "node1" playbooks/setup_node.yml --extra-vars "new_ip=172.16.0.200" --ask-become-pass`

Update your local `~/.ssh/config` if you change the ip address. 

## Update nodes

Ocassionaly you want to update your nodes

`ansible-playbook playbooks/update_system.yml --ask-become-pass`

