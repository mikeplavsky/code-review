#!/bin/bash

repo1=$1
branch=$3

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
  
  cd $2 
  git checkout $3
  cd ..

  rm -rf $2/.git

}

clone $repo1 $dir1 $branch
clone $repo2 $dir2 "master"

path=`dirname $0`
$path/creatediff.sh $dir1 $dir2

echo "Done"
