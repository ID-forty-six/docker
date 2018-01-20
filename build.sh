#!/bin/bash

# build all images

docker build -t mongodb:local mongodb/

docker build -t dbhost:local dbhost/

docker build -t phpapp:local phpapp/

docker build -t lemp:local lemp/

docker build -t nagios:local nagios/

docker build -t gemp:local gemp/




