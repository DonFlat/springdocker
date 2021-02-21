FROM adoptopenjdk:11-jre-hotspot
COPY . /app
WORKDIR /app
CMD ./gradlew clean build
WORKDIR build/libs
ENTRYPOINT ["java","-jar","springdocker-0.0.1-SNAPSHOT.jar"]



FROM ericzhang08/mavencache:latest as build
COPY . /build
WORKDIR /build
RUN mvn clean && mvn install

FROM openjdk:8
COPY --from=build /build/target/*.jar app.jar
ENTRYPOINT ["java", "-jar","/app.jar"]