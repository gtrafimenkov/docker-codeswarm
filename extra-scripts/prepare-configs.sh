#!/bin/bash

cp data/sample.config git-repo.config
sed -i s/InputFile=.*/InputFile=activity.xml/g    git-repo.config
sed -i s/ShowLegend=true/ShowLegend=false/g       git-repo.config
sed -i s/Width=640/Width=1024/g                   git-repo.config
sed -i s/Height=480/Height=768/g                  git-repo.config
