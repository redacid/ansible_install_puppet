#!/bin/bash

#ansible-playbook -i /etc/ansible/hosts puppet.yml

ansible-playbook puppet.yml --extra-var "DEPLOYSERVERS=test-servers"
