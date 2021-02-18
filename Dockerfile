FROM adoptopenjdk:11-jre-hotspot
WORKDIR ~/Documents/aws-learning/springdocker
CMD ./gradlew clean && ./gradlew build
COPY build/libs/*.jar app.jar
ENTRYPOINT ["java","-jar","app.jar"]