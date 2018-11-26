#!/bin/bash

# Config

source config

echo "HOSTS $HOSTS"
echo "STRING $STRING"
echo "NODES $NODES"

# Temp

mkdir -p $TMP
mkdir -p ./tmp
echo $STRING > $TMP/tmp

# Split String

split --numeric-suffixes --number=$NODES $TMP/tmp ./tmp/$PREFIX

# Deploy to nodes

ansible-playbook --limit "$HOSTS" ./playbooks/deploy.yml

# Clean up

rm -rf $TMP
rm -rf ./tmp
