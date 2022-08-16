#!/bin/bash
set -e
trap 'last_command=$current_command; current_command=$BASH_COMMAND' DEBUG
trap 'status_code=$?; end_command=$last_command; if [[ $status_code != 0 ]]; then echo "\"${end_command}\" command filed with exit code $status_code."; fi' EXIT

suffix=""

if [[ $BRANCH != "master" ]]
then
    suffix=$BRANCH
fi

version="$(date +'%Y.%m.%d')"
version+=".$BUILD_NUMBER"
version+="$RUN_ATTEMPT"
if [[ $suffix != "" ]]
then
    version+="-$suffix"
fi

echo $version
echo ::set-output name=version::$version

echo $SOURCE_NAME > ./GIT
echo $HASH >> ./GIT
echo "https://github.com/KamushekDev/Uniscore/commit" >> ./GIT
echo $version >> ./GIT

n=1
while read line; do
echo "#$n: $line"
n=$((n+1))
done < ./GIT
