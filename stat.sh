#!/bin/bash

ext_stat() {

  gawk -v re="$2" '{
    
    match( $0, re, arr ); 
    ext[arr[1]] +=1;

  }
  
   END { 

     for ( e in ext ) { print " ", e, ext[e]; sum += ext[e]; } 
     print ""
     print "Total: ", sum

  }' $1

}

echo
echo "Changed files:"
echo 

ext_stat $1 "Files .*[.](.*) and"

echo

