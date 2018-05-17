## dbhost

*Packages:*

Ubuntu 16.04, MongoDB 3.6, Mysql 5.7, PHP7.0-cli, snmpd, crons support;

*Sample command:*
```
docker run --name=dbhost \
    -v /home/mongodb/:/var/lib/mongodb \
    -v /home/mongodb_log/:/var/log/mongodb \
    -v /home/mysql/:/var/lib/mysql \
    -v /home/app/:/var/app \
    -v /home/snmp/:/etc/snmp \
    -v /home/cron/:/etc/cron.d \
    -p 21017:27017 \
    -p 3306:3306 \
    -p 161:161 \
    -d -e 'DB_USER=dbuser' \
    -e 'DB_PASS=dbpass' \
    -e 'DB_NAME=dbname' \
    -e 'MONGODB_USER=dbuser' \
    -e 'MONGODB_PASS=dbpass' \
    ademas/docker:dbhost
```
*If you will not set 'DB_NAME' then your 'DB_USER' will be granted for all databases (as root).*

*If you will not set 'MONGODB_USER' or 'MONGODB_PASS' your MongoDB server will be accessible without authentification.*

## dbhost2

*Packages:*

Ubuntu 16.04, MongoDB 3.6, PHP7.0-cli, snmpd, crons support;

*Sample command:*
```
docker run --name=dbhost \
    -v /home/mongodb/:/var/lib/mongodb \
    -v /home/mongodb_log/:/var/log/mongodb \
    -v /home/app/:/var/app \
    -v /home/snmp/:/etc/snmp \
    -v /home/cron/:/etc/cron.d \
    -p 21017:27017 \
    -p 3306:3306 \
    -p 161:161 \
    -d -e 'MONGODB_USER=dbuser' \
    -e 'MONGODB_PASS=dbpass' \
    ademas/docker:dbhost2
```

*If you will not set 'MONGODB_USER' or 'MONGODB_PASS' your MongoDB server will be accessible without authentification.*


## mongodb

*Packages:*

Ubuntu 16.04, MongoDB 3.6, snmpd;

*Sample command:*
```
docker run --name=mongodb \
    -v /home/mongodb/:/var/lib/mongodb \
    -v /home/mongodb_log/:/var/log/mongodb \
    -p 21017:27017 \
    -d -e 'MONGODB_USER=dbuser' \
    -e 'MONGODB_PASS=dbpass' \
    ademas/docker:mongodb
```
*If you will not set 'MONGODB_USER' or 'MONGODB_PASS' your MongoDB server will be accessible without authentification.*

## phpapp

*Packages:*

Ubuntu 16.04, Nginx, PHP7.0, php-mongodb, php-mysql, snmpd.

*Sample command:*
```
docker run --name=phpapp \
    -v /home/app/:/var/www/app \
    -v /home/log/:/var/www/log \
    -p 80:80 \
    -d -e 'NGINX_REALIP_PROXY=172.17.0.1 \
    -e 'FRAMEWORK=laravel' \
    ademas/docker:phpapp
```

## phpapp18

*Packages:*

Ubuntu 18.04, Nginx, PHP7.2, php-mongodb, php-mysql, snmpd.

*Sample command:*
```
docker run --name=phpapp \
    -v /home/app/:/var/www/app \
    -v /home/log/:/var/www/log \
    -p 80:80 \
    -d -e 'NGINX_REALIP_PROXY=172.17.0.1 \
    -e 'FRAMEWORK=laravel' \
    ademas/docker:phpapp18
```

## lemp

*Packages:*

Ubuntu 16.04, Nginx, PHP7.0-fpm, PHP7.0-cli, Mysql 5.7, php-mysql, php-mongodb, snmpd, cron support.

*Sample command:*
```
docker run --name=lemp \
    -v /home/mysql/:/var/lib/mysql \
    -v /home/app/:/var/www/app \
    -v /home/log/:/var/www/log \
    -v /home/snmp/:/etc/snmp \
    -v /home/cron/:/etc/cron.d \
    -p 161:161 \
    -p 80:80 \
    -d -e 'DB_USER=dbuser' \
    -e 'DB_PASS=dbpass' \
    -e 'DB_NAME=dbname' \
    -e 'NGINX_REALIP_PROXY=172.17.0.1 \
    -e 'FRAMEWORK=laravel' \
    juozasl/docker:lemp
```

## lemp14

*Packages:*

Ubuntu 14.04, Nginx, PHP5-fpm, PHP5-cli, Mysql, php-mysql, php-mongodb, snmpd, cron support.

*Sample command:*
```
docker run --name=lemp14 \
    -v /home/mysql/:/var/lib/mysql \
    -v /home/app/:/var/www/app \
    -v /home/log/:/var/www/log \
    -v /home/snmp/:/etc/snmp \
    -v /home/cron/:/etc/cron.d \
    -p 161:161 \
    -p 80:80 \
    -d -e 'DB_USER=dbuser' \
    -e 'DB_PASS=dbpass' \
    -e 'DB_NAME=dbname' \
    -e 'NGINX_REALIP_PROXY=172.17.0.1 \
    -e 'FRAMEWORK=laravel' \
    ademas/docker:lemp14
```

## lemp18

*Packages:*

Ubuntu 18.04, Nginx, PHP7.2-fpm, PHP7.2-cli, Mysql 5.7, php-mysql, php-mongodb, snmpd, cron support.

*Sample command:*
```
docker run --name=lemp \
    -v /home/mysql/:/var/lib/mysql \
    -v /home/app/:/var/www/app \
    -v /home/log/:/var/www/log \
    -v /home/snmp/:/etc/snmp \
    -v /home/cron/:/etc/cron.d \
    -p 161:161 \
    -p 80:80 \
    -d -e 'DB_USER=dbuser' \
    -e 'DB_PASS=dbpass' \
    -e 'DB_NAME=dbname' \
    -e 'NGINX_REALIP_PROXY=172.17.0.1 \
    -e 'FRAMEWORK=laravel' \
    juozasl/docker:lemp18
```

## gemp

*Packages:*

Ubuntu 16.04, Nginx, PHP7.0-fpm, PHP7.0-cli, MongoDB 3.6, php-mongodb, snmpd, cron support.

*Sample command:*
```
docker run --name=gemp \
    -v /home/mongodb/:/var/lib/mongodb \
    -v /home/mongodb_log/:/var/log/mongodb \
    -v /home/app/:/var/www/app \
    -v /home/log/:/var/www/log \
    -v /home/snmp/:/etc/snmp \
    -v /home/cron/:/etc/cron.d \
    -p 21017:27017 \
    -p 161:161 \
    -p 80:80 \
    -d -e 'MONGODB_USER=dbuser' \
    -e 'MONGODB_PASS=dbpass' \
    -e 'NGINX_REALIP_PROXY=172.17.0.1 \
    -e 'FRAMEWORK=laravel' \
    -e 'UPLOAD_SIZE=20M' \
    -e 'EXECUTION_TIME=120' \
    ademas/docker:gemp
```

## gemp18

*Packages:*

Ubuntu 18.04, Nginx, PHP7.2-fpm, PHP7.2-cli, MongoDB 3.6, php-mongodb, snmpd, cron support.

*Sample command:*
```
docker run --name=gemp \
    -v /home/mongodb/:/var/lib/mongodb \
    -v /home/mongodb_log/:/var/log/mongodb \
    -v /home/app/:/var/www/app \
    -v /home/log/:/var/www/log \
    -v /home/snmp/:/etc/snmp \
    -v /home/cron/:/etc/cron.d \
    -p 21017:27017 \
    -p 161:161 \
    -p 80:80 \
    -d -e 'MONGODB_USER=dbuser' \
    -e 'MONGODB_PASS=dbpass' \
    -e 'NGINX_REALIP_PROXY=172.17.0.1 \
    -e 'FRAMEWORK=laravel' \
    -e 'UPLOAD_SIZE=20M' \
    -e 'EXECUTION_TIME=120' \
    ademas/docker:gemp18
```

## nagios

*Packages:*

Ubuntu 16.04, Nagios 4.3.4, Nagios-Plugins 2.2.1, Apache2, #slack integration

*Sample command:*
```
docker run --name=nagios \
    -v /home/nagios/:/usr/local/nagios/etc \
    -p 80:80 \
    -d -e 'ADMIN_EMAIL=admin@localhost' \
    -e 'NAGIOS_PASS=password' \
    -e 'SLACK_DOMAIN=yourteamurl.slack.com' \
    -e 'SLACK_TOKEN=slack_token' \
    -e 'SLACK_CHANNEL=alerts' \
    ademas/docker:nagios
```
*Nagios admin username: nagiosadmin*





- - -


**All automated builds on:**

https://hub.docker.com/r/ademas/docker/