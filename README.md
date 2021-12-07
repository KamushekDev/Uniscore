# CreScore
Creator-score

## Installation
* Navigate to k8s folder
* `kubectl create -f namespace.yaml`
* `kubectl create -f scores/delpoy.yaml`
* install cert-manager
  * kubectl apply -f https://github.com/jetstack/cert-manager/releases/download/v1.6.1/cert-manager.yaml
  * add cloudDNS access
    * https://gouthampilla.medium.com/generating-lets-encrypt-wildcard-certs-using-cert-manager-on-gke-25bf454e5904
    * 
* issuers
* certificate
* ingresses + nginx-ingress-class
