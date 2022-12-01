#!/bin/bash

set -e

login=$1
json=$2
command=$3
home="/cli/jelastic"

if [ "$login" == "true" ]
then
  echo n | $home/users/authentication/signin --silent --login $JELASTIC_USERNAME --password $JELASTIC_PASSWORD --platformUrl $JELASTIC_URL > /dev/null
fi

$home/$command --silent true > ./response

# if [ "$json" == "true" ]
# then
#   response=$(echo "$response" | sed -n '1!p' | jq --compact-output || echo "$response")
# fi

echo cat ./response
exit 0

