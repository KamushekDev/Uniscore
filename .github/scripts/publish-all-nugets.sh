#!/bin/bash
nugets=$(find . -type f -name "*.nupkg")
# echo "$nugets"

# workflow wouldn't contain old nugets
for nuget in $nugets
do
    dotnet nuget push $nuget --api-key $GITHUB_TOKEN --source "github"
    # dotnet publish -c Release /p:Version=$BUILD_VERSION $solution
done