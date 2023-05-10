#!/bin/sh

# Set the correct permissions, verbosely
chown -v -R 1000:82 /var/www

# Run httpd in the foreground
httpd -f -vv -h /var/www/html -p 80 -c /etc/httpd.conf
