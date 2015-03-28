FROM ubuntu:14.04
MAINTAINER giacomo "giacomo@creativecoding.it"

RUN apt-get update
RUN apt-get install -y openjdk-7-jre
RUN apt-get install -y wget

RUN wget -O /var/neo4j-enterprise-2.2.0-unix.tar.gz http://dist.neo4j.org/neo4j-enterprise-2.2.0-unix.tar.gz

RUN tar -xvzf /var/neo4j-enterprise-2.2.0-unix.tar.gz -C /var

RUN sed -i 's@#org.neo4j.server.webserver.address=0.0.0.0@org.neo4j.server.webserver.address=0.0.0.0@' /var/neo4j-enterprise-2.2.0/conf/neo4j-server.properties
RUN sed -i 's@dbms.security.auth_enabled=true@dbms.security.auth_enabled=false@' /var/neo4j-enterprise-2.2.0/conf/neo4j-server.properties
RUN sed -i 's@org.neo4j.server.webserver.https.enabled=true@org.neo4j.server.webserver.https.enabled=false@' /var/neo4j-enterprise-2.2.0/conf/neo4j-server.properties

RUN sed -i 's@#allow_store_upgrade=true@allow_store_upgrade=true@' /var/neo4j-community-2.2.0/conf/neo4j.properties

ADD . /bin

RUN chmod +x /bin/start_neo4j.sh
