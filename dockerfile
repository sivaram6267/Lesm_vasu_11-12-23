FROM maven:3.8.3-openjdk-17 as build
WORKDIR /app
COPY . .
RUN mvn install -Dmaven.test.skip=true
#jdk
FROM openjdk:17-alpine
WORKDIR /app
COPY --from=build /app/target/LESM-Status-Monitor-0.0.1-SNAPSHOT.jar /app
CMD ["java", "-jar", "LESM-Status-Monitor-0.0.1-SNAPSHOT.jar"]
