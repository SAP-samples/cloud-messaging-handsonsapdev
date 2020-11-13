{
  webhook=$1
  queue=$2
}

NF==2 {
  webhooks[webhook]=queue
}

END {

  print "subgraph cluster_webhooks {\n  node [shape=parallelogram];\n  label=\"Webhooks\";"
  for (webhook in webhooks) print "  \"" webhook "\";"
  print "}\n"

  for (webhook in webhooks) {
      print "  \"" webhook "\" -> \"" webhooks[webhook] "\";"

  }

}
