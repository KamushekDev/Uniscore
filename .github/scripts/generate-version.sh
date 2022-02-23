#!/bin/bash
if [ $BRANCH != "master" ]
then
    prefix=$BRANCH
fi

export BUILD_VERSION=$prefix$(date +'%Y.%m.%d').${{github.run_number}} 
echo $BUILD_VERSION
echo ::set-output name=version::$BUILD_VERSION