#!/usr/bin/env bash

WWW_SRCDIR=$PWD/target/html/;
WWW_DESTDIR=$PWD/eclipse.website/;
STAGE=true;

if [ $1 == "stage" ]; then
  echo "Mode: Stage";
else
  echo "Mode: Live";
  STAGE=false;
  echo "Script not ready, aborting."
  exit -1;
fi

echo "WWW_SRCDIR: $WWW_SRCDIR";
echo "WWW_DESTDIR: $WWW_DESTDIR";

# copy html-resources quickly (this is super slow in the antrun plugin)
#cp -r jetty.website/src/main/html-resources/* jetty.website/target/docbkx/html

# grab the eclipse.website that is to be rendered publically
if [ -d "$WWW_DESTDIR" ]; then
  cd $WWW_DESTDIR;
  if [ $STAGE ]; then
    git checkout staging;
  else
    git checkout master;
  fi
  git pull;
else
  git clone ssh://jmcconnell@git.eclipse.org:29418/www.eclipse.org/jetty.git $WWW_DESTDIR
  if [ $STAGE ]; then
    git checkout staging;
  fi
fi

# push all absolute website files to proper git repo  > /dev/null 2>&1
rsync -azPS --filter="P .git" --delete $WWW_SRCDIR $WWW_DESTDIR

# move to perform the checkin of website content
cd $WWW_DESTDIR;

# add all changes to the commit
git add --all .

# test if there are any actual changes to commit
git diff --cached --exit-code > /dev/null 2>&1

# test exit code
if [ "$?" -ne "0" ]; then
 git commit -m "jetty-website: script deploy"
 git push origin
fi
