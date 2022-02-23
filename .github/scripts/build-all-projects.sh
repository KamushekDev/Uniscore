#!/bin/bash
solutions=$(find . -type f -name "*.sln")
# echo "$solutions"
for solution in $solutions
do
    echo "solution: $solution"
    dotnet publish -c Release /p:Version=$BUILD_VERSION $solution
done