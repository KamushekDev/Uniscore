#!/bin/bash
set -e
trap 'last_command=$current_command; current_command=$BASH_COMMAND' DEBUG
trap 'status_code=$?; end_command=$last_command; if [[ $status_code != 0 ]]; then echo "\"${end_command}\" command filed with exit code $status_code."; fi' EXIT

solutions=$(find . -type f -name "*.sln")
# echo "$solutions"

BUILD_VERSION="2022.08.16-test"
echo "build version: $BUILD_VERSION"
for solution in $solutions
do
    echo "solution: $solution"
    dotnet publish -c Release /p:Version=$BUILD_VERSION $solution
done