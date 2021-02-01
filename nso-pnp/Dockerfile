FROM centos
MAINTAINER "Johan Nemitz" <a href="mailto:jnemitz@cisco.com">jnemitz@cisco.com</a>
ARG NSO_VERSION
ARG PNP_VERSION
ENV NSO_VERSION=$NSO_VERSION
ENV PNP_VERSION=$PNP_VERSION
COPY dockerrun.sh /usr/local/bin/dockerrun.sh 
RUN \
    echo nso version: ${NSO_VERSION}; \
    echo pnp version: ${PNP_VERSION}; \
#    yum -y update; \
    yum -y install wget python2 openssh openssl; \
    ln -s /usr/bin/python2.7 /usr/bin/python; \
    mkdir /tmp/pnp-install; \
    wget http://nfs-web/software/Cisco/NSO/PNP/nso-${NSO_VERSION}-nso-pnp-${PNP_VERSION}.signed.bin -P /tmp/pnp-install; \
    chmod a+x /tmp/pnp-install/*.bin; \
    cd /tmp/pnp-install; \
    /tmp/pnp-install/*pnp*.signed.bin --skip-verification; \
    tar -xzf nso*pnp*.tar.gz; \
    /tmp/pnp-install/nso*pnp*/pnp*installer.bin --system-install; \
    chmod +x /usr/local/bin/dockerrun.sh
EXPOSE 9090
ENTRYPOINT ["/usr/local/bin/dockerrun.sh"]
