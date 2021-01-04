#!/usr/bin/env sh

#generate host keys
ssh-keygen -A
#run supervisord
/usr/bin/supervisord -c /etc/supervisord.conf