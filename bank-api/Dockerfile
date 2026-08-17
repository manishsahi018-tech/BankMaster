# bank-api — the enquiry API (replaces the legacy cbcmssrv TCP/IP server).
#
# Two stages: a JDK image builds the fat jar, a JRE image runs it. Only the
# second one ships, so the ~500 MB of JDK + Maven cache never reaches the
# target PC.
#
# Build from the bank-api directory:
#   docker build -t bank-api:0.1.0 .

# ---------------------------------------------------------------- build ----
# Pinned to 25 to match <java.version>25</java.version> in pom.xml.
FROM eclipse-temurin:25-jdk AS build
WORKDIR /build

# Dependencies first, in their own layer: as long as pom.xml is unchanged, a
# code edit reuses this layer instead of re-downloading the whole Boot 4.1 +
# Spring Security 7 dependency set.
COPY .mvn/ .mvn/
COPY mvnw pom.xml ./
# Cache-warming only, so it must not fail the build: go-offline is known to
# choke on individual plugin descriptors, and anything it misses is resolved
# by the package step below anyway.
RUN ./mvnw -B -ntp dependency:go-offline \
    || echo "go-offline incomplete — package will resolve the remainder"

# pom.xml's bundle-bank-ui execution copies ../bank-ui/dist into the jar as
# static content, so one jar can serve UI + API. In the split-container setup
# nginx serves the UI instead, and bank-ui is not in this build context at all.
# An empty directory keeps that copy-resources step happy and produces an
# API-only jar.
RUN mkdir -p /bank-ui/dist

COPY src/ src/
# Tests are a dev-machine gate, not an image-build one — a red test should stop
# a commit, not silently block a deployment rebuild. Drop -DskipTests to run
# them here too.
RUN ./mvnw -B -ntp -DskipTests package

# -------------------------------------------------------------- runtime ----
FROM eclipse-temurin:25-jre
WORKDIR /app

# Run as a non-root user: this process only reads from two databases, so it has
# no reason to be able to write to its own image.
RUN useradd --system --uid 1001 --shell /usr/sbin/nologin bank

COPY --from=build /build/target/bank-api-*.jar /app/bank-api.jar

# JDBC drivers are mounted here at run time, never baked in — the Denodo driver
# is licensed, ships with the Denodo installation, and is gitignored (see
# deploy/drivers/PUT-DRIVERS-HERE.txt). DB #2's driver lands in the same folder
# once that engine is chosen.
RUN mkdir -p /app/drivers && chown -R bank:bank /app

USER bank
EXPOSE 8085

# The jar is built with <layout>ZIP</layout>, so its launcher is Spring Boot's
# PropertiesLauncher and -Dloader.path adds the mounted drivers to the runtime
# classpath — the same mechanism deploy/run-denodo.sh uses.
#
# MaxRAMPercentage makes the JVM size its heap from the container's memory
# limit rather than from the host's total RAM.
ENTRYPOINT ["java", \
            "-XX:MaxRAMPercentage=75", \
            "-Dloader.path=/app/drivers", \
            "-jar", "/app/bank-api.jar"]
