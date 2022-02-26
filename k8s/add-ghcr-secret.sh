#!/bin/bash

# ./add-ghcr-secret.sh PersonalAccessToken

token=$1

auth=$(echo -n KamushekDev:$1 | base64)

echo '{"auths":{"ghcr.io":{"auth":"$auth"}}}' 
| kubectl create secret generic dockerconfigjson-github-com --type=kubernetes.io/dockerconfigjson --from-file=.dockerconfigjson=/dev/stdin --namespace=crescore --save-config 
| kubectl apply -f -