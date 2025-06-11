FROM amazoncorretto:24-alpine-jdk
ARG JAR_FILE=target/spring-boot-debezium-1.0-SNAPSHOT.jar
COPY ${JAR_FILE} spring-boot-debezium.jar
CMD [ "java", "-jar", "/spring-boot-debezium.jar" ]
EXPOSE 8080/tcp