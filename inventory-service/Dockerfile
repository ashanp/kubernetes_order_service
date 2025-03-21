# Use an official OpenJDK 17 runtime as the base image
FROM eclipse-temurin:17-jdk
# Set the working directory inside the container
WORKDIR /app
# Copy the JAR file from the target folder to the container
COPY target/*.jar app.jar
COPY src/main/resources/application.properties /app/config/
# Expose the application port (change if needed)
EXPOSE 8080
# Run the application
#ENTRYPOINT ["java", "-jar", "app.jar"]
ENTRYPOINT ["java", "-jar", "app.jar", "--spring.config.location=/app/config/application.properties"]