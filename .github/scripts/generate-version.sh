#!/bin/bash
suffix=""

if [[ $BRANCH != "master" ]]
then
    suffix=$BRANCH
fi

version="$(date +'%Y.%m.%d')"
version+=".$BUILD_NUMBER"
version+="$RUN_ATTEMPT"
version+="-$suffix"

echo $version
echo ::set-output name=version::$version

echo $SOURCE_NAME > ./GIT
echo $HASH >> ./GIT
echo "https://github.com/KamushekDev/CreScore/commit" >> ./GIT
echo $version >> ./GIT

echo $(cat ./GIT)
