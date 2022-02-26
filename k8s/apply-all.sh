#!/bin/bash

./apply-all.sh BUILD_VERSION

version=$1

files=$(find . -type f -name "*.yaml")
for file in $files
do
    echo $file
    sed "s/{VERSION}/$version" "$file" > "_temp_.yaml"
    echo $(cat _temp_.yaml)
done