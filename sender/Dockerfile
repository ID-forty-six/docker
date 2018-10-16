FROM ubuntu:14.04

# ++ Supervisor install

RUN apt update && apt install -y supervisor
COPY supervisor/* /etc/supervisor/conf.d/

# ++ www server & php  installation
RUN apt update && apt install -y nginx php5-fpm php5-cli php5-mysql php5-gd php5-mcrypt php5-mysql php5-xmlrpc php5-curl curl