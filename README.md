[![Scores](https://github.com/KamushekDev/Uniscore/actions/workflows/publish-nugets.yaml/badge.svg)](https://github.com/KamushekDev/Uniscore/actions/workflows/publish-nugets.yaml)
# Uniscore
Scores

## Project Installation
* Navigate to k8s folder
* `kubectl create -f namespace.yaml`
* `./add-ghcr-secret.sh GITHUB_PersonalAccessToken`
* install cert-manager
  * `kubectl apply -f https://github.com/jetstack/cert-manager/releases/download/v1.6.1/cert-manager.yaml`
  * add cloudDNS access (Idea from: https://gouthampilla.medium.com/generating-lets-encrypt-wildcard-certs-using-cert-manager-on-gke-25bf454e5904)
    * `./add-cloudflare-secret.sh CLOUDFLARE_PersonalAccessToken`
* ingress-nginx
  * https://kubernetes.github.io/ingress-nginx/deploy/#bare-metal-clusters
* `kubectl create secret generic -n uniscore firebase-admin-sdk-json --from-file=./adminsdk.json`
* `./apply-all.sh LAST_PACKAGES_VERSION`