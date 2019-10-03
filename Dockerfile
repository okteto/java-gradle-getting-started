FROM gradle:5.1-jdk11 as builder
COPY --chown=gradle:gradle . .
RUN gradle build

FROM openjdk:11-jre-slim
EXPOSE 8080
WORKDIR /app
COPY --from=builder /home/gradle/build/libs/*.jar .
CMD java -jar *.jar