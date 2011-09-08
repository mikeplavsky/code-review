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

}

clone $repo1 $dir1
clone $repo2 $dir2

echo "creating diff file for $dir1 and $dir2"
diff -qr $dir1 $dir2 | sort > res.diff    

echo "Done"
