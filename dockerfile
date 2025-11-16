FROM alpine:latest
# Install Python 3 and pip, then install tarsnapper in a virtual environment, then verify tarsnapper is runnable.
RUN apk add --update --no-cache busybox-suid \
    && apk add --no-cache python3 py3-pip \
    && python3 -m venv /opt/venv \
    && /opt/venv/bin/pip install --upgrade pip setuptools \
    && /opt/venv/bin/pip install tarsnapper
ENV PATH="/opt/venv/bin:$PATH"
RUN tarsnapper --help

# Configure tarsnapper parameters
RUN mkdir /backups /data
ENV TARSNAPPER_OUTPUT_DIR="/backups"
ENV TARSNAPPER_BACKUP_NAME="backup-\$(date)"
ENV TARSNAPPER_SOURCES="/data"
ENV TARSNAPPER_DELTAS=""
ENV TARSNAPPER_CRON=""

COPY ./docker-entrypoint.sh /entrypoint.sh
ENTRYPOINT [ "/entrypoint.sh" ]
