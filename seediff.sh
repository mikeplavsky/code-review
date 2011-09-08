#!/bin/bash

gf() {
  gawk -v n=$3 -v l=$2 '{ if (NR == l) {match($0,"Files (.*) and (.*) differ", arr); print arr[n];}}' $1
}

vimdiff "`gf $1 $2 1`" "`gf $1 $2 2`"
