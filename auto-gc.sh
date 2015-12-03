#!/bin/bash

GIT_LOCAL_PATH=$HOME/repositories/
GIT_REPOSITORIES=$(find $GIT_LOCAL_PATH -maxdepth 1 -type d -name *.git)

for repo in $GIT_REPOSITORIES
do
	cmd="cd $repo && git -c gc.reflogExpire=0 -c gc.reflogExpireUnreachable=0 \
	-c gc.rerereresolved=0 -c gc.rerereunresolved=0 -c gc.pruneExpire=now gc \"\$@\""
	echo "git gc unused objects in $repo ..."
	echo $cmd
	eval $cmd
	echo
done

