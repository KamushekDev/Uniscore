#!/bin/bash

#./apply-all.sh BUILD_VERSION

# version=$1

# echo "Building apps for version $version"

# touch current.yaml.temp
files=$(find . -type f -name "*.yaml")
for file in $files
do
    echo $file
    # sed "s/{VERSION}/$version/" $file > current.yaml.temp

    # echo $(cat current.yaml.temp)
    # kubectl apply -f current.yaml.temp
    kubectl apply -f $file
done

kubectl rollout restart -f ./services/

# deployments=$(kubectl get deploy -A -o name)
# for deploy in $deployments
# do
#     echo "Restarting $deploy"
#     # sed "s/{VERSION}/$version/" $file > current.yaml.temp

#     # echo $(cat current.yaml.temp)
#     # kubectl apply -f current.yaml.temp
#     kubectl rollout restart $deploy -A
#     kubectl rollout restart $deploy -A
    
# done
# rm current.yaml.temp