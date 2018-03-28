# Ubuntu 16.04, Nginx, PHP7.1, Mysql 5.7, php-mongodb, snmpd, cron support.

FROM ubuntu:16.04

#ENV DEBIAN_FRONTEND noninteractive

# ++ Supervisor install

RUN apt update && apt install -y supervisor software-properties-common
COPY supervisor/* /etc/supervisor/conf.d/

# ++ Mysql 5.7

RUN DEBIAN_FRONTEND=noninteractive apt install -y mysql-server mysql-client

VOLUME /var/lib/mysql

ADD set_mysql_auth.sh /set_mysql_auth.sh

# ++ www server install 
RUN DEBIAN_FRONTEND=noninteractive LC_ALL=C.UTF-8 add-apt-repository -y ppa:ondrej/php
RUN apt-get update
RUN DEBIAN_FRONTEND=noninteractive apt-get install -y mc nginx curl \
    php7.1 php7.1-fpm php7.1-cli php7.1-mysql php7.1-gd php7.1-mcrypt php7.1-mbstring \
    php7.1-mysql php7.1-zip php7.1-xmlrpc php7.1-xml php7.1-curl php7.1-bcmath php7.1-bz2 php-mongodb \
    phpmyadmin

# ++ NodeJS install
RUN curl -sL https://deb.nodesource.com/setup_6.x -o nodesource_setup.sh
RUN bash nodesource_setup.sh
RUN apt-get install -y nodejs

# ++ config
RUN sed -i 's/;cgi.fix_pathinfo/cgi.fix_pathinfo/' /etc/php/7.1/fpm/php.ini
RUN sed -i 's/max_execution_time = 30/max_execution_time = 0/' /etc/php/7.1/cli/php.ini
COPY nginx/* /etc/nginx/sites-available/
RUN cd /etc/nginx/sites-enabled/ && ln -s ../sites-available/phpmyadmin

# ++ volumes
VOLUME /var/www/app/
VOLUME /var/www/log/

# ++ ports
EXPOSE 80
EXPOSE 8080

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

