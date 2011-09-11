#!/usr/bin/gawk -f 

function ext_stat(file,patt,res) {

  while (getline < file) {

    match( $0, patt, arr) 
    if ( arr[1] ) { res[arr[1]] += 1; }

  }

}

function print_array(arr) {
  for ( e in arr ) { print " ", e, arr[e]; } 
}

BEGIN {


  ext_stat( "changed.diff", "Files .*[.](.*) and", changed )
  ext_stat( "new.diff", "Only in .*[.](.*)", new )

  for (e in changed) { sum += changed[e]; }

  for (e in changed) { 
    if (new[e]) {
      changed[e] -= new[e];
      if (!changed[e]) {delete changed[e];}
    }
    else { delete new[e]; }
  }

  print "\nChanged Files:\n"
  print_array( changed )
  print ""

  print "New files:\n"
  print_array( new )
  print ""
  
  print "Total: ", sum, "\n"
}
