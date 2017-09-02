FROM        openjdk:8-jdk
MAINTAINER  Ramazan AYYILDIZ <rayyildiz@gmail.com>

ENV         KOTLIN_VERSION=1.1.4-2 \
            KOTLIN_HOME=/usr/local/kotlin

RUN         apt-update -y && \
            apt-get install ca-certificates && \
            update-ca-certificates && \
            apt-get openssl wget bash

RUN         cd  /tmp && \
            wget -k "https://github.com/JetBrains/kotlin/releases/download/v${KOTLIN_VERSION}/kotlin-compiler-${KOTLIN_VERSION}.zip"  && \
            unzip "kotlin-compiler-${KOTLIN_VERSION}.zip" && \
            mkdir -p "${KOTLIN_HOME}" && \
            mv "/tmp/kotlinc/bin" "/tmp/kotlinc/lib" "${KOTLIN_HOME}" && \
            rm ${KOTLIN_HOME}/bin/*.bat && \
            chmod +x ${KOTLIN_HOME}/bin/* && \
            ln -s "${KOTLIN_HOME}/bin/"* "/usr/bin/" && \
            rm -rf /tmp/* /var/cache/apk/*
