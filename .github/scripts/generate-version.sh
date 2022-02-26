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