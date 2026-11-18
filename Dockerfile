FROM gradle:9.9.1-jdk25 AS build
WORKDIR /code
COPY . /code/
RUN gradle build

FROM eclipse-temurin:25-jre
EXPOSE 8080
WORKDIR /app
COPY --from=build /code/build/libs/*.jar .
CMD java -jar *.jar
