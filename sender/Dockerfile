# Ubuntu 14.04, Nginx, PHP5, Postfix, cron support.

FROM ubuntu:14.04

# ++ Supervisor install

RUN apt update && apt install -y supervisor
COPY supervisor/* /etc/supervisor/conf.d/

# ++ www server & php  installation
RUN apt update && apt install -y nginx php5-fpm php5-cli php5-gd php5-mcrypt php5-xmlrpc php5-curl curl

# ++ APP volume
VOLUME /var/app/

# -- setup nginx

# ++ crons support
RUN apt update && apt install -y cron run-one
RUN touch /etc/cron.d/app
RUN chmod 0644 /etc/cron.d/app

VOLUME /etc/cron.d/

# -- Postfix

# set workdir
WORKDIR /var/app

# ++ run all necessary daemons
ADD run.sh /run.sh
ENTRYPOINT ["/run.sh"]