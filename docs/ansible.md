
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

`ansible all -m shell -a 'uptime'`

`ansible all -m ping`

## Resources

* https://docs.ansible.com
