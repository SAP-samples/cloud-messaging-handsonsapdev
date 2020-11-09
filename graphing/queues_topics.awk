NF==1 { queues[$1]=$1 }
NF==2 { topics[$2]=$1 }
END {

  print "subgraph cluster_queues {\n  node [shape=folder];\n  label=\"Queues\";"
  for (q in queues)
    print "  \"" q "\""
  print "}\n"

  print "..."

  for (t in topics)
    print topics[t] " -> " t

}
