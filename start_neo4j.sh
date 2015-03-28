#!/bin/bash

limit=`ulimit -n`
if [ "$limit" -lt 65536 ]; then
    ulimit -n 65536;
fi

# Start Neo4j with our configuration
/var/neo4j-enterprise-2.2.0/bin/neo4j console