#!/bin/bash

GIT_LOCAL_PATH=$HOME/repositories
GIT_REPOSITORIES=$(ssh leonlei@172.17.21.62 'ls /home/git | grep ".git"')

GIT_USERNAME=leonlei
GIT_HOST=172.17.21.62
GIT_URL=ssh://$GIT_USERNAME@$GIT_HOST

for repo in $GIT_REPOSITORIES
do
	if [ -d "$GIT_LOCAL_PATH/$repo" ]; then
		echo "fetch $repo ..."
		cmd="cd $GIT_LOCAL_PATH/$repo && git fetch"
	else
		echo "clone $repo ..."
		cmd="cd $GIT_LOCAL_PATH && git clone --mirror $GIT_URL:/home/git/$repo"
	fi
	
	echo $cmd
	eval $cmd
	echo 
done

