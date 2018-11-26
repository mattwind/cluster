# Permutations

This example will split the work over all nodes and iterate through all possible permutations of a given string.

## Config File

Edit the `config` file and set desired variables.

## Deploy Job

I use bash to do the dirty work and ansible to deploy and execute the job.

`execute.sh`

After the jobs are finished it will generate segmented permutation file per node.

`ssh node00 'head ~/permute/out'`

### Notes

Since this uses the split command and generates sequential files for the string, your ansible inventory suffix must start with 00.

