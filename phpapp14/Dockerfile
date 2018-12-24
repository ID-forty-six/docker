# LEMP build for old php5 version
# Ubuntu 14.04, Nginx, PHP5, PHP5-cli, php-mongodb, snmpd, cron support.

FROM ubuntu:14.04

#ENV DEBIAN_FRONTEND noninteractive

# ++ Supervisor install

RUN apt update && apt install -y supervisor
COPY supervisor/* /etc/supervisor/conf.d/

# ++ www server install 
RUN apt update && apt install -y nginx php5-fpm php5-cli php5-mysql php5-gd php5-mcrypt php5-xmlrpc php5-curl php-pear curl

# ++ config
COPY php_ini/fpm_php.ini /etc/php5/fpm/php.ini
COPY php_ini/cli_php.ini /etc/php5/cli/php.ini
COPY nginx/default_yii2 /etc/nginx/sites-available/default_yii2
COPY nginx/default_plain /etc/nginx/sites-available/default_plain
COPY nginx/default_laravel /etc/nginx/sites-available/default_laravel

RUN pear install PEAR-1.10.1
RUN pear install Mail-1.4.1
RUN pear install Mail_Mime-1.10.2
RUN pear install Net_SMTP

# ++ volumes
VOLUME /var/www/app/
VOLUME /var/www/log/

# ++ ports
EXPOSE 80

# ++ snmpd install

RUN apt update && apt install -y snmpd
RUN echo "rocommunity public 127.0.0.1" > /etc/snmp/snmpd.conf
RUN sed -i 's/snmpd.pid/snmpd.pid -c \/etc\/snmp\/snmpd.conf/' /etc/default/snmpd

ADD files/checksupervisor.sh /usr/local/bin/checksupervisor.sh

VOLUME /etc/snmp/
EXPOSE 161/udp

# ++ crons support
RUN apt update && apt install -y cron run-one
RUN touch /etc/cron.d/app
RUN chmod 0644 /etc/cron.d/app

VOLUME /etc/cron.d/

WORKDIR /var/www/app

# ++ run all necessary daemons
ADD run.sh /run.sh
ENTRYPOINT ["/run.sh"]

