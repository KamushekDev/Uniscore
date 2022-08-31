[![dotnet - Uniscore.Auth](https://byob.yarr.is/KamushekDev/Uniscore/uniscore-auth)](https://github.com/KamushekDev/Uniscore/actions/workflows/dotnet-uniscore-auth.yaml)
[![dotnet - Uniscore.Shared](https://github.com/KamushekDev/Uniscore/actions/workflows/dotnet-uniscore-shared.yaml/badge.svg?branch=master&event=push)](https://github.com/KamushekDev/Uniscore/actions/workflows/dotnet-uniscore-shared.yaml)
[![dotnet - Uniscore.Users](https://github.com/KamushekDev/Uniscore/actions/workflows/dotnet-uniscore-users.yaml/badge.svg?branch=master&event=push)](https://github.com/KamushekDev/Uniscore/actions/workflows/dotnet-uniscore-users.yaml)
[![dotnet - Uniscore.Events.Twitch](https://github.com/KamushekDev/Uniscore/actions/workflows/dotnet-uniscore-events-twitch.yaml/badge.svg?branch=master&event=push)](https://github.com/KamushekDev/Uniscore/actions/workflows/dotnet-uniscore-events-twitch.yaml)
[![dotnet - Uniscore.Scores](https://github.com/KamushekDev/Uniscore/actions/workflows/dotnet-uniscore-scores.yaml/badge.svg?branch=master&event=push)](https://github.com/KamushekDev/Uniscore/actions/workflows/dotnet-uniscore-scores.yaml)

[![react - uniscore-placeholder](https://github.com/KamushekDev/Uniscore/actions/workflows/react-uniscore-placeholder.yaml/badge.svg?branch=master&event=push)](https://github.com/KamushekDev/Uniscore/actions/workflows/react-uniscore-placeholder.yaml)

[![codecov](https://codecov.io/gh/KamushekDev/Uniscore/branch/master/graph/badge.svg?token=KVIZEJSKAI)](https://codecov.io/gh/KamushekDev/Uniscore)

# [Issues - Youtrack](https://kamushek.myjetbrains.com/youtrack/issues/UN)

# Uniscore

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


Add kube metrics to prometheus
* git clone https://github.com/devopscube/kube-state-metrics-configs.git
* kubectl apply -f kube-state-metrics-configs/
* kubectl get deployments kube-state-metrics -n kube-system

Add longhorn
* kubectl apply -f https://raw.githubusercontent.com/longhorn/longhorn/master/deploy/longhorn.yaml
* create storageClass with needed amount of replicas