#!/bin/bash
set -e

COMMAND=/usr/local/bin/ansible-playbook
echo "{}" > /ansible/vars.json

ANSIBLE_ARGS="-v /ansible/playbook.yml --verbose -i 127.0.0.1,"

# $ANSIBLE_EXTRA_VARS is set by fig
if [ "$ANSIBLE_EXTRA_VARS" ]; then
    # clean-up the JSON stored in the variable and save to vars.json
    echo "$ANSIBLE_EXTRA_VARS" | sed s#\'#\"#g | python -mjson.tool > /ansible/vars.json
    ANSIBLE_ARGS="${ANSIBLE_ARGS} -e '@vars.json'"
fi

echo "$ANSIBLE_ARGS"

# if first argument begins with a -
if [ "${1:0:1}" = '-' ]; then
    # set ansible-playbook as the executable
    set -- $COMMAND "$@" $ANSIBLE_ARGS
else
    # ensure ansible-playbook runs to provision the container *before* running
    # mysqld
    echo "$COMMAND $ANSIBLE_ARGS"
    $COMMAND $ANSIBLE_ARGS
fi

exec $@
