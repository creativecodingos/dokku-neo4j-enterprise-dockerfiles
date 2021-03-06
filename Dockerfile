FROM ubuntu:14.04
MAINTAINER Giacomo Triggiano "giacomo@creativecoding.it"

RUN apt-get update
RUN apt-get install -y openjdk-7-jre
RUN apt-get install -y wget

RUN wget -O /var/neo4j-enterprise-2.2.1-unix.tar.gz http://dist.neo4j.org/neo4j-enterprise-2.2.1-unix.tar.gz

RUN tar -xvzf /var/neo4j-enterprise-2.2.1-unix.tar.gz -C /var
RUN mv /var/neo4j-enterprise-2.2.1 /var/neo4j

RUN sed -i 's@#org.neo4j.server.webserver.address=0.0.0.0@org.neo4j.server.webserver.address=0.0.0.0@' /var/neo4j/conf/neo4j-server.properties
RUN sed -i 's@dbms.security.auth_enabled=true@dbms.security.auth_enabled=false@' /var/neo4j/conf/neo4j-server.properties
RUN sed -i 's@org.neo4j.server.webserver.https.enabled=true@org.neo4j.server.webserver.https.enabled=false@' /var/neo4j/conf/neo4j-server.properties

RUN sed -i 's@#remote_shell_enabled=true@remote_shell_enabled=true@' /var/neo4j/conf/neo4j.properties
RUN sed -i 's@#remote_shell_host=127.0.0.1@remote_shell_host=0.0.0.0@' /var/neo4j/conf/neo4j.properties
RUN sed -i 's@#allow_store_upgrade=true@allow_store_upgrade=true@' /var/neo4j/conf/neo4j.properties
RUN sed -i 's@online_backup_server=127.0.0.1:6362@online_backup_server=0.0.0.0:6362@' /var/neo4j/conf/neo4j.properties

EXPOSE 7474
EXPOSE 6362
EXPOSE 1337

ADD . /bin

RUN chmod +x /bin/start_neo4j.sh
RUN chmod +x /bin/purge_data.sh

CMD ["/bin/start_neo4j.sh"]