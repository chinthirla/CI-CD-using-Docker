FROM tomcat:latest

LABEL maintainer="Vijay kumar"

ADD ./target/LoginWebApp-1.war /usr/local/tomcat/webapps/

EXPOSE 8082

CMD ["catalina.sh", "run"]
