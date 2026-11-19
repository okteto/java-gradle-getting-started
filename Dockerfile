FROM eclipse-temurin:25.0.5_8-jdk-resolute AS dev

WORKDIR /usr/src/app
COPY gradlew settings.gradle build.gradle ./
COPY gradle gradle
RUN ./gradlew --no-daemon dependencies
COPY . .
RUN ./gradlew --no-daemon assemble

FROM eclipse-temurin:25.0.5_8-jre-resolute AS prod

COPY --from=dev /usr/src/app/build/libs/helloworld.jar /usr/local/lib/hello-world.jar
CMD ["java", "-jar", "/usr/local/lib/hello-world.jar"]
