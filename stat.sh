#!/bin/bash

ext_stat() {

  gawk -v re="$2" '{
    
    match( $0, re, arr ); 
    if (arr[1]) { ext[arr[1]] +=1; }

  }
  
   END { 

     for ( e in ext ) { print " ", e, ext[e] } 

  }' $1

}

echo
echo "Changed files:"
echo 

ext_stat $1 "Files .*[.](.*) and"

echo
echo "New files:"
echo

ext_stat $1 "Only in .*[.](.*)"

echo
