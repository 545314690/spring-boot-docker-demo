FROM frolvlad/alpine-oraclejdk8:slim
FROM maven:3.5.0-jdk-8
VOLUME /tmp
#ADD mvn mvn
#RUN chmod +x mvnw
RUN mvn package
ADD target/spring-boot-docker-demo-0.0.1-SNAPSHOT.jar app.jar
ENV JAVA_OPTS=""
ENTRYPOINT [ "sh", "-c", "java $JAVA_OPTS -Djava.security.egd=file:/dev/./urandom -jar /app.jar" ]
