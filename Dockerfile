FROM gradle AS dev
WORKDIR /code
COPY . /code/
RUN gradle build

FROM openjdk:8-jre AS prod
EXPOSE 8080
WORKDIR /app
COPY --from=dev /code/build/libs/*.jar .
CMD java -jar *.jar