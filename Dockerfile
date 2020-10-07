# Pull base image.
FROM ubuntu:latest

RUN \
# Update
apt-get update -y && \
# Install Java
apt-get install default-jre -y

ADD serving-web-content-0.0.1-SNAPSHOT.jar spring-mvc-example.jar

#ADD /mnt/c/Users/91735/Documents/myweb-0.0.7-SNAPSHOT.war myweb-0.0.7-SNAPSHOT.war

#COPY myweb-0.0.7-SNAPSHOT.war /usr/local/webapps/

EXPOSE 8082

CMD java -jar spring-mvc-example.jar
