#!/bin/bash

repo1=$1
repo2=$2 

diff -qr $repo1 $repo2 | sort > res.diff
