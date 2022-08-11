#!/bin/bash

set -e
echo "hello 1"

export HOME=/cli  # To overwrite GitHub run command

echo "hello 2"

cd $HOME
echo "hello 3"
IFS=" " read -r -a args <<< "$@"
echo "hello 4"
response=$(/cli/entrypoint.sh "${args[@]}")
echo "::set-output name=output::$response"
