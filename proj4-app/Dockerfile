FROM eclipse-temurin:17-jdk-alpine
WORKDIR /proj4-app
COPY target/proj4-app-1.0-SNAPSHOT.jar app.jar
EXPOSE 8080
ENTRYPOINT ["java", "-jar", "app.jar"]