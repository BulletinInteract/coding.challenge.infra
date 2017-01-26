#!/usr/bin/env bash
action=$1
env=$2

terraform $action \
  -var-file=./config/default.tfvars \
  -var-file=./config/${env}.tfvars \
  -state=./states/state_${env}.tfstate

if [ "$action" = "apply" ]; then
  sleep 120
  
  for i in 1 2 3 4 5 6 7 8
  do
    sleep 30

    ip=$(cat states/state_${env}.tfstate | grep "\"public_ip\"" | awk '{gsub(/\"/,"")}; 1' | awk '{gsub(/\,/,"")}; 1' | awk '{print $2}')

    if [ ! -z "$ip" ]; then
      echo "Checking $env: $ip"
      curl $ip
      echo ""
    fi
  done
fi
