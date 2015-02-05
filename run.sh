#!/bin/bash
set -e

ANSIBLE_ARGS="-v /ansible/playbook.yml --verbose -i 127.0.0.1,"
if [ "$ANSIBLE_EXTRA_VARS" ]; then
    echo "$ANSIBLE_EXTRA_VARS" | sed s#\'#\"#g | python -mjson.tool > /ansible/vars.json
    ANSIBLE_ARGS="${ANSIBLE_ARGS} --extra-vars '@vars.json'"
fi

ansible-playbook --version
ansible-playbook $ANSIBLE_ARGS

/usr/sbin/mysqld