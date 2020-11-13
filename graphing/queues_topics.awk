{
  queue=$1
  topic=$2
}

NF==1 {
  queues[queue]=queue
}

NF==2 {
  topics[topic]=topic
  subs[queue]=subs[queue] topic " "
}

END {

  print "subgraph cluster_queues {\n  node [shape=folder];\n  label=\"Queues\";"
  for (queue in queues) print "  \"" queue "\";"
  print "}\n"
  print "subgraph cluster_topics {\n  node [shape=doubleoctagon];\n  label=\"Queues\";"
  for (topic in topics) print "  \"" topic "\";"
  print "}\n"

  for (queue in subs) {
    split(subs[queue], ts)
    for (topic in ts)
      print "  \"" queue "\" -> \"" ts[topic] "\";"


  }

}
