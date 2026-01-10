#!/bin/sh

set -e

if [ "$1" == "" ]; then


    chmod 764 -R /etc/bind;
    chown bind:bind -R /etc/bind;
    echo "************************** /etc/bind **************************";
    ls -l /etc/bind;

    chmod 764 -R /var/bind;
    chown bind:bind -R /var/bind;
    echo "************************** /var/bind **************************";
    ls -l /var/bind;

    chmod 764 -R /var/log;
    chown bind:bind -R /var/log;
    echo "************************** /var **************************";
    ls -l /var;


    echo "**************************  **************************";

    /usr/sbin/named -u bind -f -c /etc/bind/named.conf -L /var/log/default.log


else

    exec "$@"

fi
