# Use a multi-stage build to minimize the final image size

# Stage 1: Build the application
FROM maven:3.8.1-openjdk-11-slim AS build
WORKDIR /app

# Copy the Maven descriptor and resolve dependencies
COPY pom.xml ./
COPY src ./src

# Install the project's dependencies and build the application
RUN mvn clean package -DskipTests

# Stage 2: Run the application
FROM openjdk:11-jre-slim
WORKDIR /app

# Copy the built JAR file from the build stage
COPY --from=build /app/target/*.jar /app/app.jar

# Expose the application port (default for Spring Boot)
EXPOSE 8080

# Run the application
ENTRYPOINT ["java", "-jar", "/target/my-application-0.0.1-SNAPSHOT.jar.original"]

