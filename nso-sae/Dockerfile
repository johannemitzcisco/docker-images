FROM nfs-web.lab.local:443/cisco-nso:5.2.3.6
MAINTAINER "Johan Nemitz" <a href="mailto:jnemitz@cisco.com">jnemitz@cisco.com</a>
ARG NSO_VERSION
ARG SAE_VERSION
ENV NSO_VERSION=$NSO_VERSION
ENV SAE_VERSION=$SAE_VERSION
COPY dockerrun.sh /usr/local/bin/dockerrun.sh 
RUN \
    chmod +x /usr/local/bin/dockerrun.sh; \
    echo NSO version: ${NSO_VERSION}; \
    echo SAE  version: ${PNP_VERSION}; \
#    yum -y update; \
#    yum -y install wget python2 openssh openssl; \
    ln -s /usr/bin/python2.7 /usr/bin/python; \
    mkdir /tmp/sae-install; \
    wget http://nfs-web/software/Cisco/SAE/nso-${NSO_VERSION}-cisco-sae-core-fp-${SAE_VERSION}.signed.bin -P /tmp/sae-install; \
    chmod a+x /tmp/sae-install/*.bin; \
    cd /tmp/sae-install; \
    /tmp/sae-install/*sae*.signed.bin; \
    tar -xzf nso*sae*.tar.gz
#    /tmp/sae-install/nso*sae*/local-install/local-install.sh /opt/sae
EXPOSE 80
ENTRYPOINT ["/usr/local/bin/dockerrun.sh"]
