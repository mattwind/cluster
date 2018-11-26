# Permutations

This example will split the work over all nodes and iterate through all possible permutations of a given string.

## Config File

Edit the `config` file and set desired variables.

## Deploy Job

I use bash to do the dirty work and ansible to deploy and execute the job.

`execute.sh`

## Finding the needle

After the jobs are finished it will generate segmented permutation file per node. We can use parallel to search all the nodes.

`parallel --progress --tag -S .. --nonall "grep -nw kghij ~/permute/out"`

The results found `node01  120:kghij`

See the MD5 Checksum.

`ssh node01 "sed -n 120p ~/permute/out.md5"`

### Notes

Since this uses the split command and generates sequential files for the string, your ansible inventory suffix must start with 00.

Also make certain `~/.parallel/sshloginfile` is setup correctly. Mine is just the list of nodes, same names in ansible inventory.

