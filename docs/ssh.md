
## SSH Key

Generate an ssh 

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
