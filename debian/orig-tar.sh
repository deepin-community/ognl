#!/bin/sh -e

# $1 version
TAR=../ognl_$1.orig.tar.gz
DIR=ognl-$1.orig
TAG=$1

# clean up the upstream tarball
mkdir $DIR
svn export --force http://svn.opensymphony.com/svn/ognl/tags/$TAG $DIR
GZIP=--best tar -c -z -f $TAR -X debian/orig-tar.exclude $DIR
rm -rf $DIR

# move to directory 'tarballs'
if [ -r .svn/deb-layout ]; then
  . .svn/deb-layout
  mv $TAR $origDir
  echo "moved $TAR to $origDir"
fi

exit 0
