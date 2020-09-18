FROM amd64/openjdk:14-slim
COPY demo-0.0.1-SNAPSHOT.jar /app/app.jar
WORKDIR /app
EXPOSE 8080/tcp
ENTRYPOINT ["java", "-jar", "app.jar"]
