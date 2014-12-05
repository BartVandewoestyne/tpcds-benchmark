#!/usr/bin/awk -f
#
# Split the given query file (output of dsqgen, containing all the queries in
# one file) into individual query files.

/-- start query [0-9]+ in stream [0-9]+ using template query[0-9]+.tpl/ {

  match($10, /[0-9]+/)

  fn=sprintf("query_%02d.hql", substr($10, RSTART, RLENGTH))
  print "Writing: ", fn

}

{ print $0 >> fn; }
