FROM apache/activemq-artemis:2.37.0-alpine
RUN mkdir -p /var/lib/artemis-instance/etc-override
COPY ./etc/broker.xml /var/lib/artemis-instance/etc-override
COPY ./etc/bootstrap.xml /var/lib/artemis-instance/etc-override
COPY ./etc/log4j2.properties /var/lib/artemis-instance/etc-override
COPY ./etc/artemis-users.properties /var/lib/artemis-instance/etc-override
COPY ./etc/artemis-roles.properties /var/lib/artemis-instance/etc-override
COPY ./lib /var/lib/artemis-instance/lib

# Apparently, bootstrap.xml and artemis-users.properties file don't support variable substitution, so we need to have a script that will replace the ADMIN password with the one provided as env variable.
COPY ./entrypoint.sh /var/lib/artemis-instance/entrypoint.sh
USER root
RUN chmod +x /var/lib/artemis-instance/entrypoint.sh
#RUN mkdir /var/lib/artemis-instance && chown -R artemis:artemis /var/lib/artemis-instance
USER artemis
ENTRYPOINT ["/var/lib/artemis-instance/entrypoint.sh"]