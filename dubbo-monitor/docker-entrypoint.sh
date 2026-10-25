#!/bin/bash
set -euo pipefail

DEPLOY_DIR=/opt/dubbo-monitor-simple
cd "${DEPLOY_DIR}"

mkdir -p /data/monitor/statistics /data/monitor/charts logs

CONF_DIR="${DEPLOY_DIR}/conf"
LIB_DIR="${DEPLOY_DIR}/lib"
LIB_JARS=""
for jar in "${LIB_DIR}"/*.jar; do
  LIB_JARS="${LIB_JARS}:${jar}"
done
LIB_JARS="${LIB_JARS#:}"

exec java \
  -Djava.awt.headless=true \
  -Djava.net.preferIPv4Stack=true \
  -Xms128m -Xmx512m \
  -classpath "${CONF_DIR}:${LIB_JARS}" \
  com.alibaba.dubbo.container.Main
