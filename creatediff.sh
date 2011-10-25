#!/bin/bash

dir1=$1
dir2=$2

echo "creating diff files for $dir1 and $dir2"

diff -qrN $dir1 $dir2 | sort > changed.diff
echo "changed.diff done"

diff -qr $dir1 $dir2 | grep "Only in" | sort | grep -v "Only in GitQuest" >  new.diff
echo "new.diff done"

