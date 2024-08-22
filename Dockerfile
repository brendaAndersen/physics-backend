# Stage 1: Build
FROM ubuntu:latest AS build

# Install OpenJDK 17
RUN apt-get update && \
    apt-get install -y openjdk-17-jdk maven

# Set the working directory
WORKDIR /app

# Copy the project files into the container
COPY . .

# Build the project and package it as a JAR file
RUN mvn clean package -DskipTests

# Stage 2: Runtime
FROM openjdk:17-jdk-slim

# Expose the port the application will run on
EXPOSE 8080

# Copy the JAR file from the build stage into the runtime stage
COPY --from=build /app/target/auth-api-1.0.0.jar /app.jar

# Define the command to run the JAR file
ENTRYPOINT ["java", "-jar", "/app.jar"]
