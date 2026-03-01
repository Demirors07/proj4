FROM eclipse-temurin:17-jdk-alpine
WORKDIR /proj4-app
COPY /var/lib/jenkins/workspace/proj4-test1/proj4-app/target app.jar
EXPOSE 8080
ENTRYPOINT ["java", "-jar", "app.jar"]