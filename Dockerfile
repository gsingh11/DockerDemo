FROM oraclelinux:latest

MAINTAINER Gopi Krishna Anabham <anabham.gopi95@gmail.com>


WORKDIR /root
RUN mkdir -p /root/Java && yum install -y wget && wget --no-cookies --no-check-certificate --header "Cookie: gpw_e24=http%3A%2F%2Fwww.oracle.com%2F; oraclelicense=accept-securebackup-cookie" "http://download.oracle.com/otn-pub/java/jdk/8u141-b15/336fa29ff2bb4ef291e347e091f7f4a7/jdk-8u141-linux-x64.tar.gz" -O /root/Java/jdk-8u141-linux-x64.tar.gz && tar -xvzf /root/Java/jdk-8u141-linux-x64.tar.gz -C /root/Java/ && wget http://mirrors.estointernet.in/apache/maven/maven-3/3.6.0/binaries/apache-maven-3.6.0-bin.tar.gz && tar -xvzf apache-maven-3.6.0-bin.tar.gz -C /tmp

COPY HelloWorld  /root/

ENV JAVA_HOME /root/Java/jdk1.8.0_141
ENV M2_HOME /tmp/apache-maven-3.6.0
ENV PATH  $JAVA_HOME/bin:$M2_HOME/bin:$PATH

RUN java -version
RUN ln -s /tmp/apache-maven-3.6.0/bin/mvn /usr/bin/mvn
RUN mvn -version
RUN mvn compile && mvn package && java -cp target/HelloWorld-1.0-SNAPSHOT.jar com.gopi.app.App

