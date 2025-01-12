FROM ubuntu:22.04
RUN apt-get update
RUN apt-get install openjdk-11-jdk -y && apt-get install curl -y

ENV CATALINA_HOME /usr/local/tomcat
ENV PATH $CATALINA_HOME/bin:$PATH

RUN mkdir -p "$CATALINA_HOME" && apt-get update

WORKDIR $CATALINA_HOME

ENV TOMCAT_MAJOR 10
ENV TOMCAT_VERSION 10.1.34
ENV TOMCAT_TGZ_URL https://dlcdn.apache.org/tomcat/tomcat-$TOMCAT_MAJOR/v$TOMCAT_VERSION/bin/apache-tomcat-$TOMCAT_VERSION.tar.gz
RUN set -x \
    && curl -fSL "$TOMCAT_TGZ_URL" -o tomcat.tar.gz \
    && curl -fSL "$TOMCAT_TGZ_URL.asc" -o tomcat.tar.gz.asc \
    && tar -xvf tomcat.tar.gz --strip-components=1 \
    && rm bin/*.bat \
    && rm tomcat.tar.gz*

EXPOSE 8080
CMD ["catalina.sh", "run"]
