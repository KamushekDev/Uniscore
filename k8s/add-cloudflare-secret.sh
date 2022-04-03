#!/bin/bash

# ./add-ghcr-secret.sh PersonalAccessToken

token=$1

# auth=$(echo -n KamushekDev:$1 | base64)
# echo $auth
# authString='{"auths":{"ghcr.io":{"auth":"'
# authString+=$auth
# authString+='"}}}'
secret="api-token="
secret+=$token

kubectl create secret generic cloudflare-api-token-secret \
	--type=Opaque \
	--from-literal=$secret \
	--namespace=crescore --save-config \
	--dry-run=client -o yaml |
kubectl apply -f -
