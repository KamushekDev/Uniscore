#!/bin/bash
solutions=$(find . -type f -name "*.sln")
# echo "$solutions"
echo "build version: $BUILD_VERSION"
for solution in $solutions
do
    echo "solution: $solution"
    dotnet publish -c Release /p:Version=$BUILD_VERSION $solution
done