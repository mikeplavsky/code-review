#!/bin/bash

gf() {
  gawk -v l=$1 '{ if (NR == l) print $0 }' new.diff
}

vim "`gf $1`"
