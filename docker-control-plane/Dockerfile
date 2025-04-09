FROM apache/activemq-artemis:2.37.0-alpine
RUN mkdir -p /var/lib/artemis-instance/etc-override
COPY ./etc/broker.xml /var/lib/artemis-instance/etc-override
COPY ./etc/log4j2.properties /var/lib/artemis-instance/etc-override
#nopx
COPY ./lib /var/lib/artemis-instance/lib