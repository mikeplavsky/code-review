#!/bin/bash

dir1=$1
dir2=$2

echo "creating diff files for $dir1 and $dir2"

diff -qr $dir1 $dir2 | sort > all.diff
cat all.diff | grep -v "Only in" > changed.diff
echo "changed.diff done"

path=`dirname $0`

cat all.diff | grep "Only in" | sort | grep -v "$dir2" | $path/sedproc | xargs -l1 find > new.diff
echo "new.diff done"

