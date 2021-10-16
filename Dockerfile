From prom/prometheus:latest
ADD prometheus.yml /etc/prometheus/
ARG SCRAPE_SERVICE_NAME
ARG SCRAPE_SERVICE_PORT
USER root
RUN sed -i "s/SCRAPE_SERVICE_NAME/${SCRAPE_SERVICE_NAME}/g" /etc/prometheus/prometheus.yml
RUN sed -i "s/SCRAPE_SERVICE_PORT/${SCRAPE_SERVICE_PORT}/g" /etc/prometheus/prometheus.yml
