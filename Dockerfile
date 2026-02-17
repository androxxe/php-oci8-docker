ARG PHP_VERSION=8.2
FROM php:${PHP_VERSION}-cli

RUN apt-get update && apt-get install -y \
    $(apt-cache show libaio1t64 >/dev/null 2>&1 && echo "libaio1t64" || echo "libaio1") \
    libnsl2 \
    unzip \
    curl \
    && rm -rf /var/lib/apt/lists/* \
    && ([ -f /usr/lib/$(uname -m)-linux-gnu/libaio.so.1t64 ] && ln -sf /usr/lib/$(uname -m)-linux-gnu/libaio.so.1t64 /usr/lib/$(uname -m)-linux-gnu/libaio.so.1 || true)

RUN ARCH=$(dpkg --print-architecture) && \
    mkdir -p /opt/oracle && cd /opt/oracle && \
    if [ "$ARCH" = "arm64" ]; then \
        curl -fSL https://download.oracle.com/otn_software/linux/instantclient/2370000/instantclient-basic-linux.arm64-23.7.0.25.01.zip -o instantclient-basic.zip && \
        curl -fSL https://download.oracle.com/otn_software/linux/instantclient/2370000/instantclient-sdk-linux.arm64-23.7.0.25.01.zip -o instantclient-sdk.zip; \
    else \
        curl -fSL https://download.oracle.com/otn_software/linux/instantclient/2370000/instantclient-basic-linux.x64-23.7.0.25.01.zip -o instantclient-basic.zip && \
        curl -fSL https://download.oracle.com/otn_software/linux/instantclient/2370000/instantclient-sdk-linux.x64-23.7.0.25.01.zip -o instantclient-sdk.zip; \
    fi && \
    unzip -o instantclient-basic.zip && \
    unzip -o instantclient-sdk.zip && \
    rm -f *.zip && \
    INSTANT_CLIENT_DIR=$(ls -d /opt/oracle/instantclient_* | head -1) && \
    echo $INSTANT_CLIENT_DIR > /etc/ld.so.conf.d/oracle-instantclient.conf && \
    ldconfig

RUN INSTANT_CLIENT_DIR=$(ls -d /opt/oracle/instantclient_* | head -1) && \
    docker-php-ext-configure oci8 --with-oci8=instantclient,$INSTANT_CLIENT_DIR && \
    docker-php-ext-install oci8

ENV LD_LIBRARY_PATH=/opt/oracle/instantclient_23_7

COPY --from=composer:latest /usr/bin/composer /usr/bin/composer

WORKDIR /app
