#!/bin/bash

gf() {
  gawk -v n=$2 -v l=$1 '{ if (NR == l) {match($0,"Files (.*) and (.*) differ", arr); print arr[n];}}' changed.diff
}

vimdiff "`gf $1 1`" "`gf $1 2`"
