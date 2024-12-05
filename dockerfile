FROM ubuntu:20.04

RUN apt-get update && apt-get install -y \
    wget \
    x11vnc \
    novnc \
    websockify \
    supervisor \
    && rm -rf /var/lib/apt/lists/*

RUN wget https://github.com/novnc/noVNC/archive/v1.2.0.tar.gz && \
    tar -xvzf v1.2.0.tar.gz && \
    mv noVNC-1.2.0 /opt/novnc && \
    rm v1.2.0.tar.gz

COPY start.sh /start.sh
RUN chmod +x /start.sh

EXPOSE 5900 6080

CMD ["/start.sh"]
