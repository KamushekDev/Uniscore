#!/bin/bash

# ./add-cloudflare-secret.sh CLOUDFLARE_PersonalAccessToken

# Got idea from: https://gouthampilla.medium.com/generating-lets-encrypt-wildcard-certs-using-cert-manager-on-gke-25bf454e5904

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
	--namespace=cert-manager --save-config \
	--dry-run=client -o yaml |
kubectl apply -f -
