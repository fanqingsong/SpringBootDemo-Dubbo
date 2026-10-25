# syntax=docker/dockerfile:1

ARG JRE_IMAGE=swr.cn-north-4.myhuaweicloud.com/ddn-k8s/docker.io/eclipse-temurin:8-jre

FROM ${JRE_IMAGE}
WORKDIR /opt/dubbo-monitor-simple

COPY dubbo-monitor/bundle/ /opt/dubbo-monitor-simple/
COPY dubbo-monitor/docker-entrypoint.sh /opt/dubbo-monitor-simple/bin/docker-entrypoint.sh
RUN chmod +x /opt/dubbo-monitor-simple/bin/docker-entrypoint.sh

EXPOSE 8080 7070

ENTRYPOINT ["/opt/dubbo-monitor-simple/bin/docker-entrypoint.sh"]
