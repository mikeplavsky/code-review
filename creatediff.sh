#!/bin/bash

rm_slash() {
  echo $1 | sed -e "s/\/$//" 
}

dir1=`rm_slash $1`
dir2=`rm_slash $2`

echo "creating diff files for $dir1 and $dir2"

diff -qr $dir1 $dir2 | sort > all.diff

cat all.diff | grep -v "Only in" > changed.diff
cat changed.diff | sed -e "s/ and .*$//;s/Files $dir1\///" > rchanged.diff

echo "changed.diff done"

path=`dirname $0`

cat all.diff | grep "Only in" | sort | grep -v "$dir2" | $path/sedproc | xargs -l1 find > new.diff
cat new.diff | sed -e "s/$dir1\///" > rnew.diff
echo "new.diff done"

