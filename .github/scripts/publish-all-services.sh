#!/bin/bash

dockerFiles=$(find . -type f -name "Dockerfile")
# nugets=$(find . -type f -name "*.nupkg")
# echo "$nugets"
# echo "build version: $BUILD_VERSION"
# workflow wouldn't contain old nugets
for file in $dockerFiles
do
    echo $file
    name="name_placeholder"
    if [[ $file =~ (.*)/([^/]+)/Dockerfile ]]; then
        name="${BASH_REMATCH[2]}"
    else
        echo "path does not match the pattern"
        continue
    fi
    fullname=$name:$BUILD_VERSION
    docker build -t $BUILD_VERSION --build-arg proto_os=linux --build-arg proto_cpu=arm64 -f $file
    # docker push
    # dotnet nuget push $nuget --api-key $GITHUB_TOKEN --source "github"
    # dotnet publish -c Release /p:Version=$BUILD_VERSION $solution
done



# echo -n KamushekDev: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 | base64
# echo '{"auths":{"ghcr.io":{"auth":"S2FtdXNoZWtEZXY6Z2hwX21PV2ZDMFZrV2RnQUsyN0d2emVGd0VhdngweWVGNjBXbWtDMA=="}}}' | kubectl create secret generic dockerconfigjson-github-com --type=kubernetes.io/dockerconfigjson --from-file=.dockerconfigjson=/dev/stdin --namespace=crescore