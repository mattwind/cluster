
# Automate parallel nodes

My notes on setting up a network with ansible for parallel computing. I use Debian locally and setup a bunch of Centos 7.5 nodes.

## SSH Key

First create a key for your nodes.

`ssh-keygen -f ./id_rsa -b 4096`

Copy the ssh key to your node.

`ssh-copy-id -i ./id_rsa admin@172.16.0.174`

Setup your local ssh config.

`vi ~/.ssh/config`

Add your node information.

```
Host node1
  Hostname 172.16.0.174
  User admin
  IdentityFile "path_to_node_id_rsa"
```

## Ansible Playbooks

On your host machine, setup ansible.

`sudo apt-get install ansible`

Then update your inventory.

`sudo vi /etc/ansible/hosts`

Mine looks like this.

```
[nodes]
node1
node2
node3
```

## Setup a new node

After I build an new server and install the base system, I get a dhcp address then I run setup playbook from my local machine.

You will want to specify the ansible host defined in your inventory and the new ip to configure.

`ansible-playbook node1 playbooks/setup_node.yml --extra-vars "ip=172.16.0.200" --ask-become-pass`

This command will configure everything automatically. Update your local .ssh/config if you change the ip address. 

## Update node

Ocassionaly you want to update your nodes

`ansible-playbook playbooks/update_system.yml --ask-become-pass`

## Ansible Ad-Hoc Command

Get some information from your nodes.

`ansible all -m shell -a 'uptime'`

`ansible all -m ping`

## Resources

* https://www.gnu.org/software/parallel/
* https://opensource.com/article/18/5/gnu-parallel
* https://docs.ansible.com


