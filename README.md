# Summary
## Services:

### .NET:
[![dotnet - Uniscore.Auth](https://github.com/KamushekDev/Uniscore/actions/workflows/uniscore-auth.yaml/badge.svg?branch=master&event=push)](https://github.com/KamushekDev/Uniscore/actions/workflows/uniscore-auth.yaml) [![latest success](https://byob.yarr.is/KamushekDev/Uniscore/uniscore-auth)](https://github.com/KamushekDev/Uniscore/actions/workflows/uniscore-auth.yaml) [![codecov](https://codecov.io/gh/KamushekDev/Uniscore/branch/master/graph/badge.svg?token=KVIZEJSKAI&precision=1&flag=uniscore-auth)](https://codecov.io/gh/KamushekDev/Uniscore)

[![dotnet - Uniscore.Users](https://github.com/KamushekDev/Uniscore/actions/workflows/uniscore-users.yaml/badge.svg?branch=master&event=push)](https://github.com/KamushekDev/Uniscore/actions/workflows/uniscore-users.yaml) [![latest success](https://byob.yarr.is/KamushekDev/Uniscore/uniscore-users)](https://github.com/KamushekDev/Uniscore/actions/workflows/uniscore-users.yaml) [![codecov](https://codecov.io/gh/KamushekDev/Uniscore/branch/master/graph/badge.svg?token=KVIZEJSKAI&precision=1&flag=uniscore-users)](https://codecov.io/gh/KamushekDev/Uniscore)

[![dotnet - Uniscore.Events.Twitch](https://github.com/KamushekDev/Uniscore/actions/workflows/uniscore-events-twitch.yaml/badge.svg?branch=master&event=push)](https://github.com/KamushekDev/Uniscore/actions/workflows/uniscore-events-twitch.yaml) [![latest success](https://byob.yarr.is/KamushekDev/Uniscore/uniscore-events-twitch)](https://github.com/KamushekDev/Uniscore/actions/workflows/uniscore-events-twitch.yaml) [![codecov](https://codecov.io/gh/KamushekDev/Uniscore/branch/master/graph/badge.svg?token=KVIZEJSKAI&precision=1&flag=uniscore-events-twitch)](https://codecov.io/gh/KamushekDev/Uniscore)

[![dotnet - Uniscore.Scores](https://github.com/KamushekDev/Uniscore/actions/workflows/uniscore-scores.yaml/badge.svg?branch=master&event=push)](https://github.com/KamushekDev/Uniscore/actions/workflows/uniscore-scores.yaml) [![latest success](https://byob.yarr.is/KamushekDev/Uniscore/uniscore-scores)](https://github.com/KamushekDev/Uniscore/actions/workflows/uniscore-scores.yaml) [![codecov](https://codecov.io/gh/KamushekDev/Uniscore/branch/master/graph/badge.svg?token=KVIZEJSKAI&precision=1&flag=uniscore-scores)](https://codecov.io/gh/KamushekDev/Uniscore)

### React:
[![react - Uniscore.Placeholder](https://github.com/KamushekDev/Uniscore/actions/workflows/react-uniscore-placeholder.yaml/badge.svg?branch=master&event=push)](https://github.com/KamushekDev/Uniscore/actions/workflows/react-uniscore-placeholder.yaml) [![latest success](https://byob.yarr.is/KamushekDev/Uniscore/uniscore-placeholder)](https://github.com/KamushekDev/Uniscore/actions/workflows/react-uniscore-placeholder.yaml) [![codecov](https://codecov.io/gh/KamushekDev/Uniscore/branch/master/graph/badge.svg?token=KVIZEJSKAI&precision=1&flag=uniscore-placeholder)](https://codecov.io/gh/KamushekDev/Uniscore)

## Libraries:  

### .NET:
[![dotnet - Uniscore.Shared](https://github.com/KamushekDev/Uniscore/actions/workflows/uniscore-shared.yaml/badge.svg?branch=master&event=push)](https://github.com/KamushekDev/Uniscore/actions/workflows/uniscore-shared.yaml) [![latest success](https://byob.yarr.is/KamushekDev/Uniscore/uniscore-shared)](https://github.com/KamushekDev/Uniscore/actions/workflows/uniscore-shared.yaml) [![codecov](https://codecov.io/gh/KamushekDev/Uniscore/branch/master/graph/badge.svg?token=KVIZEJSKAI&precision=1&flag=uniscore-shared)](https://codecov.io/gh/KamushekDev/Uniscore)

---

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
* microk8s enable helm3
* microk8s kubectl create namespace longhorn-system
* microk8s helm3 install longhorn longhorn/longhorn --namespace longhorn-system \
  --set defaultSettings.defaultDataPath="/longhorn" \
  --set csi.kubeletRootDir="/var/snap/microk8s/common/var/lib/kubelet"
* ~~kubectl apply -f https://raw.githubusercontent.com/longhorn/longhorn/master/deploy/longhorn.yaml~~
* `sudo apt-get install open-iscsi` **(CLUSTER INIT JOB DOESN'T DO IT)**
* create storageClass with needed amount of replicas