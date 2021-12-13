# CreScore
Creator-score

## Installation
* Navigate to k8s folder
* `kubectl create -f namespace.yaml`
* Deploy scores
  * publish image (https://stackoverflow.com/a/61912590/10105448)
    * Base-64 encode <your-github-username>:<TOKEN>, ie.: `echo -n VojtechVitek:4eee0faaab222ab333aa444aeee0eee7ccc555b7 | base64` => <AUTH>
    * echo '{"auths":{"ghcr.io":{"auth":"<AUTH>"}}}' | kubectl create secret generic dockerconfigjson-github-com --type=kubernetes.io/dockerconfigjson --from-file=.dockerconfigjson=/dev/stdin
  * `kubectl create -f scores.yaml`
* install cert-manager
  * kubectl apply -f https://github.com/jetstack/cert-manager/releases/download/v1.6.1/cert-manager.yaml
  * add cloudDNS access
    * https://gouthampilla.medium.com/generating-lets-encrypt-wildcard-certs-using-cert-manager-on-gke-25bf454e5904
    * kubectl create secret generic clouddns-dns01-solver-svc-acct --namespace cert-manager --from-file=key.json
    * 
* `kubectl create -f issuers.yaml`
* `kubectl create -f certificate.yaml`
* ingresses
  * `kubectl create -f http-ingress.yaml`
  * `kubectl create -f grpc-ingress.yaml`
  * `kubectl create -f nginx-ingress-class.yaml`
  * ingress-nginx
    * https://kubernetes.github.io/ingress-nginx/deploy/#bare-metal-clusters
