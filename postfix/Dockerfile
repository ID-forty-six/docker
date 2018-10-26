# Ubuntu 14.04, Nginx, PHP5, Postfix, cron support.

FROM ubuntu:14.04

# ++ Supervisor install

RUN apt update && apt install -y supervisor
COPY supervisor/* /etc/supervisor/conf.d/
COPY files/postfix.sh /opt/postfix.sh

# ++ www server, php ir postix  installation
RUN apt update && apt install -y curl postfix lynx

# volumes
VOLUME /var/spool/postfix/
VOLUME /etc/postfix/

# set workdir
WORKDIR /var/app

# ++ run all necessary daemons
ADD run.sh /run.sh
ENTRYPOINT ["/run.sh"]