FROM alpine

MAINTAINER nikhil2584@gmail.com

RUN mkdir /opt/tomcat/

WORKDIR /opt/tomcat
RUN curl -O https://downloads.apache.org/tomcat/tomcat-10/v10.0.23/bin/apache-tomcat-10.0.23.tar.gz
RUN tar xvfz apache*.tar.gz
RUN mv apache-tomcat-10.0.23/* /opt/tomcat/.
RUN yum -y install java
RUN java -version

WORKDIR /opt/tomcat/webapps
RUN curl -O -L https://github.com/AKSarav/SampleWebApp/raw/master/dist/SampleWebApp.war

EXPOSE 8181

CMD ["/opt/tomcat/bin/catalina.sh", "run"]