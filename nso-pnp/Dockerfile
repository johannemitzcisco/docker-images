FROM centos
MAINTAINER "Johan Nemitz" <a href="mailto:jnemitz@cisco.com">jnemitz@cisco.com</a>
RUN yum -y update; \
    yum -y wget python2 openssh openssl; \
    ln -s /usr/bin/python2.7 /usr/bin/python; \
    mkdir /tmp/pnp-install; \
	wget http://nfs-web/software/Cisco/NSO/PNP/nso-5.3.1.1-nso-pnp-3.0.0.signed.bin -P /tmp/pnp-install
	chmod a+x /tmp/pnp-install/*.bin; \
	cd /tmp/pnp-install; \
	/tmp/pnp-install/*pnp*.signed.bin --skip-verification; \
	tar -xzf nso*pnp*.tar.gz; \
	/tmp/pnp-install/nso*pnp*/pnp*installer.bin --system-install; \
	/etc/init.d/confd start
EXPOSE 9090
CMD ["/usr/sbin/init"]