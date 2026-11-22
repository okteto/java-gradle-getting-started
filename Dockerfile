FROM eclipse-temurin:25.0.5_8-jdk-resolute AS dev

WORKDIR /usr/src/app
COPY . .

# The cache mount keeps the Gradle home, with the Gradle distribution and the
# dependencies, in the Okteto Build Service, which reuses it between builds.
# The tests of the Okteto Manifest use the same cache
RUN --mount=type=cache,target=/root/.gradle \
    ./gradlew --no-daemon assemble

FROM eclipse-temurin:25.0.5_8-jre-resolute AS prod

COPY --from=dev /usr/src/app/build/libs/helloworld.jar /usr/local/lib/hello-world.jar
CMD ["java", "-jar", "/usr/local/lib/hello-world.jar"]
