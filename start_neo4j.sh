#!/bin/bash

limit=`ulimit -n`
if [ "$limit" -lt 65536 ]; then
    ulimit -n 65536;
fi

# Start Neo4j with our configuration
/var/neo4j/bin/neo4j console