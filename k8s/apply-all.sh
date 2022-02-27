#!/bin/bash

#./apply-all.sh BUILD_VERSION

version=$1

echo "Building apps for version $version"

touch current.yaml.temp
files=$(find . -type f -name "*.yaml")
for file in $files
do
    echo $file
    sed "s/{VERSION}/$version/" $file > current.yaml.temp
    # echo $(cat current.yaml.temp)
    kubectl apply -f current.yaml.temp
done

rm current.yaml.temp
