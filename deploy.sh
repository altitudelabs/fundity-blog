#!/bin/bash

now="$(date +'%d/%m/%Y/%r')"
echo $now

# set up new git remote, add, commit to today's datetime
git init .
echo "node_modules" >> .gitignore
git add --all
git commit -m "$now"
git remote add deploy ubuntu@52.74.197.63:/home/ubuntu/repos/evalend-blog

# push to aws
git push deploy master --force

# clean up dist
cd ..
rm -rf dist