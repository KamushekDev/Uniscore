#!/bin/bash
set -e
trap 'last_command=$current_command; current_command=$BASH_COMMAND' DEBUG
trap 'if [[$? != 0]]; then echo "\"${last_command}\" command filed with exit code $?."; fi' EXIT

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

    if [[ $name != uniscore* ]]; then
        name="uniscore-${name}"
    fi

    if [[ $file =~ (.*)/Dockerfile ]]; then
        path="${BASH_REMATCH[1]}"
    else
        echo "path does not match the pattern"
        continue
    fi

    cp ./GIT "$path/GIT"
    echo $(find . -type f -name "GIT")

    rep=$( echo $USERNAME | tr '[:upper:]' '[:lower:]' )

    fullname=$REGISTRY/$rep/$name:$BUILD_VERSION
    # docker build -t fullname --build-arg proto_os=linux --build-arg proto_cpu=arm64 $path
    export DOCKER_BUILDKIT=1
    docker build -t $fullname --secret id=packages_pat,src=./PACKAGES_PAT $path
    docker push $fullname
done
