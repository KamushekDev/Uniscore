#!/bin/bash

dockerFiles=$(find . -type f -name "Dockerfile")
for file in $dockerFiles
do
    echo $file
    name="name_placeholder"
    path="path_placeholder"
    if [[ $file =~ (.*)/([^/]+)/Dockerfile ]]; then
        name="${BASH_REMATCH[2]}"
    else
        echo "path does not match the pattern"
        continue
    fi
    if [[ $file =~ (.*)/Dockerfile ]]; then
        path="${BASH_REMATCH[1]}"
    else
        echo "path does not match the pattern"
        continue
    fi

    rep=$( echo $USERNAME | tr '[:upper:]' '[:lower:]' )

    fullname=$REGISTRY/$rep/$name:$BUILD_VERSION
    # docker build -t fullname --build-arg proto_os=linux --build-arg proto_cpu=arm64 $path
    docker build -t $fullname $path
    docker push $fullname
done