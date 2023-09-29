FROM openjdk:17-alpine

EXPOSE 8080

COPY target/*.war /usr/bin/spring-petclinic.war

ENTRYPOINT ["java","-jar","/usr/bin/spring-petclinic.war","--server.port=8080" ]