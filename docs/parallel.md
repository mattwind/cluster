# Reference

* https://www.gnu.org/software/parallel/man.html
* http://www.shakthimaan.com/posts/2014/11/27/gnu-parallel/news.html

## Setup SSH Login File

Edit `~/.parallel/sshloginfile` for continuity keep the same hostnames as `/etc/ansible/hosts` and `.ssh/config`

## Distributed command

To distribute the commands to a list of nodes, make a file cluster.lst with all the node names from `.ssh/config`:

```
node1
node2
node3
```

Then run:

`seq 10 | parallel --sshloginfile cluster.lst echo`
