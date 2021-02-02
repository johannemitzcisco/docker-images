#!/bin/sh
yum -y update
/etc/init.d/ncs start
#Extra line added in the script to run all command line arguments
exec "$@"

