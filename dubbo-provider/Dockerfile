# syntax=docker/dockerfile:1

ARG MAVEN_IMAGE=swr.cn-north-4.myhuaweicloud.com/ddn-k8s/docker.io/maven:3.9-eclipse-temurin-8
ARG JRE_IMAGE=swr.cn-north-4.myhuaweicloud.com/ddn-k8s/docker.io/eclipse-temurin:8-jre

FROM ${MAVEN_IMAGE} AS builder
WORKDIR /build

COPY pom.xml .
COPY dubbo-api/pom.xml dubbo-api/
COPY dubbo-provider/pom.xml dubbo-provider/
# 父 POM 声明了全部 module，需存在对应 pom.xml（不拷贝其它服务源码）
COPY dubbo-consumer/pom.xml dubbo-consumer/

RUN mvn -B -pl dubbo-provider -am dependency:go-offline -DskipTests || true

COPY dubbo-api/src dubbo-api/src
COPY dubbo-provider/src dubbo-provider/src

RUN mvn -B -pl dubbo-provider -am package -DskipTests

FROM ${JRE_IMAGE}
WORKDIR /app

COPY --from=builder /build/dubbo-provider/target/dubbo-provider-0.0.1-SNAPSHOT.jar /app/app.jar

ENV SPRING_PROFILES_ACTIVE=docker
EXPOSE 9011 20880

ENTRYPOINT ["java", "-jar", "/app/app.jar"]
