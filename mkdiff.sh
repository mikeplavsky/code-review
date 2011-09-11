#!/bin/bash

repo1=$1
repo2=$2 

gdir(){
 echo $1 | gawk '{match($0,"git@github.com:(.*)/",arr);print arr[1]}' 
}

dir1=`gdir $repo1`
dir2=`gdir $repo2`

clone(){

  echo "clonning $1"
  rm -rf $2
  git clone $1 $2
  rm -rf $2/.git

}

clone $repo1 $dir1
clone $repo2 $dir2

echo "creating diff files for $dir1 and $dir2"

diff -qrN $dir1 $dir2 | sort > changed.diff
echo "changed.diff done"

diff -qr $dir1 $dir2 | grep "Only in" | sort > new.diff
echo "new.diff done"

echo "Done"
