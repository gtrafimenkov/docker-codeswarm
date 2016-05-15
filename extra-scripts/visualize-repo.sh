#!/bin/bash

# visualize repository
# only git is supported by this script at the moment

REPO=${1:-/repo}

test -d $REPO/.git || (echo "Error: git repository isn't found in $REPO" 2>&1 && exit 1)

cd $REPO
git log --name-status --pretty=format:'%n------------------------------------------------------------------------%nr%h | %ae | %ai (%aD) | x lines%nChanged paths:' >/codeswarm/trunk/activity.log

cd /codeswarm/trunk

python convert_logs/convert_logs.py -s activity.log activity.xml

java -Xmx1000m -classpath dist/code_swarm.jar:lib/core.jar:lib/xml.jar:lib/vecmath.jar:. code_swarm git-repo.config
