#!/bin/bash
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
