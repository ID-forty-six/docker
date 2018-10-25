# Ubuntu 14.04, Nginx, PHP5, Postfix, cron support.

FROM ubuntu:14.04

# ++ Supervisor install

RUN apt update && apt install -y supervisor
COPY supervisor/* /etc/supervisor/conf.d/
COPY files/postfix.sh /opt/postfix.sh

# ++ www server, php ir postix  installation
RUN apt update && apt install -y nginx php5-cli php5-gd php5-mcrypt php5-xmlrpc php5-curl curl postfix lynx

EXPOSE 80

# ++ crons support
RUN apt update && apt install -y cron run-one
RUN touch /etc/cron.d/app
RUN chmod 0644 /etc/cron.d/app

# volumes
VOLUME /var/app/
VOLUME /var/spool/postfix/
VOLUME /etc/postfix/
VOLUME /etc/nginx/
VOLUME /etc/cron.d/

# set workdir
WORKDIR /var/app

# ++ run all necessary daemons
ADD run.sh /run.sh
ENTRYPOINT ["/run.sh"]