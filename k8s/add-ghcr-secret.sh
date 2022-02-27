#!/bin/bash

# ./add-ghcr-secret.sh PersonalAccessToken

token=$1

auth=$(echo -n KamushekDev:$1 | base64)
# echo $auth
authString='{"auths":{"ghcr.io":{"auth":"'
authString+=$auth
authString+='"}}}'

# echo $authString
kubectl create secret generic dockerconfigjson-github-com \
	--type=kubernetes.io/dockerconfigjson \
	--from-literal=.dockerconfigjson=$authString \
	--namespace=crescore --save-config \
	--dry-run=client -o yaml |
kubectl apply -f -