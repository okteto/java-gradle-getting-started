FROM gradle as builder
COPY . .
RUN gradle build

FROM openjdk:8-jre
EXPOSE 8080
WORKDIR /app
COPY --from=builder /home/gradle/build/libs/*.jar .
CMD java -jar *.jar