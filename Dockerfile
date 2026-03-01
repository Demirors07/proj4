FROM eclipse-temurin:17-jdk-alpine
WORKDIR /proj4app
COPY target/proj4-app-0.0.1-SNAPSHOT.jar app.jar
EXPOSE 8080
ENTRYPOINT ["java", "-jar", "app.jar"]