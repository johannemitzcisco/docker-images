FROM centos
MAINTAINER "Johan Nemitz" <a href="mailto:jnemitz@cisco.com">jnemitz@cisco.com</a>
ARG NSO_VERSION
ENV NSO_VERSION=$NSO_VERSION
COPY dockerrun.sh /usr/local/bin/dockerrun.sh 
RUN \
    chmod +x /usr/local/bin/dockerrun.sh; \
    echo nso version: ${NSO_VERSION}; \
    yum -y update; \
    yum -y install wget python2 openssh openssl ant java; \
    mkdir /tmp/nso-install; \
    wget http://nfs-web/software/Cisco/NSO/binaries/nso-${NSO_VERSION}.linux.x86_64.installer.bin -P /tmp/nso-install; \
    chmod a+x /tmp/nso-install/*.bin; \
    cd /tmp/nso-install; \
    /tmp/nso-install/nso-${NSO_VERSION}.linux.x86_64.installer.bin --system-install; \
    groupadd ncsadmin; \
    groupadd ncsoper
# NSO GUI
EXPOSE 8080
EXPOSE 443
# NSO NETCONF SSH
EXPOSE 2022
# NSO NETCONF
EXPOSE 830
ENTRYPOINT ["/usr/local/bin/dockerrun.sh"]
