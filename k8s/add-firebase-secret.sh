#!/bin/bash

# ./add-firebase-secret.sh /home/pi/secrets/admin.json

# Got idea from: https://gouthampilla.medium.com/generating-lets-encrypt-wildcard-certs-using-cert-manager-on-gke-25bf454e5904

jsonPath=$1

kubectl create secret generic firebase-admin-sdk-json \
	--type=Opaque \
	--from-file=$jsonPath \
	--namespace=uniscore --save-config \
	--dry-run=client -o yaml |
kubectl apply -f -
