#!/bin/bash

set -e

# super visor deamons start
exec /usr/bin/supervisord -n -c /etc/supervisor/supervisord.conf
