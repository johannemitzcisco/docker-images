#!/bin/sh
/etc/init.d/confd start
#Extra line added in the script to run all command line arguments
exec "$@"

