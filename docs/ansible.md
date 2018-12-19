
## Setup Ansible 

On Debian 

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

## Running Playbooks

`ansible-playbook filename.yml`

Escalate privileges

`ansible-playbook filename.yml --ask-become-pass`

Limit host

`ansible-playbook --limit "node1" filename.yml`

## Ansible Ad-Hoc Command

Check uptime

`ansible all -m shell -a 'uptime'`

Ping nodes

`ansible all -m ping`

## Ansible Ad-Hock Sudo command

Cleanup old kerenels

`ansible all -m shell -a 'package-cleanup -y --oldkernels --count=1' --ask-become-pass --become`

Reboot

`ansible all -m shell -a 'reboot' --ask-become-pass --become`

Get motherboard information

`ansible all -m shell -a 'dmidecode --type baseboard | grep -A3 Manufacturer' --ask-become-pass --become`

## Resources

* https://docs.ansible.com
