#!/bin/bash

gf() {
  gawk -v l=$2 '{ if (NR == l) {match($0,"Only in (.*): (.*)$", arr); print arr[1] "/" arr[2] ;}}' $1
}

vim "`gf $1 $2`"
