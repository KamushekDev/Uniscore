#!/bin/bash
set -e
trap 'last_command=$current_command; current_command=$BASH_COMMAND' DEBUG
trap 'echo "\"${last_command}\" command filed with exit code $?."' EXIT

solutions=$(find . -type f -name "*.sln")
# echo "$solutions"
echo "build version: $BUILD_VERSION"
for solution in $solutions
do
    echo "solution: $solution"
    dotnet publish -c Release /p:Version=$BUILD_VERSION $solution
done