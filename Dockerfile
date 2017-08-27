FROM frolvlad/alpine-oraclejdk8:slim
FROM maven
VOLUME /tmp
ADD ./ /app/
#RUN ls /app/
#RUN sh /app/mvnw install dockerfile:build
RUN cd /app/ && mvn install
ADD target/spring-boot-docker-demo-0.0.1-SNAPSHOT.jar app.jar
ENV JAVA_OPTS=""
ENTRYPOINT [ "sh", "-c", "java $JAVA_OPTS -Djava.security.egd=file:/dev/./urandom -jar /app.jar" ]
