#!/bin/bash

echo $PACKAGES_PAT > ./PACKAGES_PAT

dockerFiles=$(find . -type f -name "Dockerfile")
for file in $dockerFiles
do
    echo $file
    name="name_placeholder"
    path="path_placeholder"
    if [[ $file =~ (.*)/([^/]+)/Dockerfile ]]; then
        name="${BASH_REMATCH[2]}"
    else
        echo "name does not match the pattern"
        continue
    fi

    if [[ $file =~ (.*)/Dockerfile ]]; then
        path="${BASH_REMATCH[1]}"
    else
        echo "path does not match the pattern"
        continue
    fi

    source ./get-git-info.sh > GIT
    echo $(cat GIT)

    rep=$( echo $USERNAME | tr '[:upper:]' '[:lower:]' )

    fullname=$REGISTRY/$rep/$name:$BUILD_VERSION
    # docker build -t fullname --build-arg proto_os=linux --build-arg proto_cpu=arm64 $path
    export DOCKER_BUILDKIT=1
    docker build -t $fullname --secret id=packages_pat,src=./PACKAGES_PAT $path
    docker push $fullname
done
