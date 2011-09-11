#!/bin/bash

gf() {
  gawk -v l=$1 '{ if (NR == l) {match($0,"Only in (.*): (.*)$", arr); print arr[1] "/" arr[2] ;}}' new.diff
}

vim "`gf $1`"
