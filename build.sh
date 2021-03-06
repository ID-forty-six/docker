#!/bin/bash

# build all images

docker build -t mongodb:local mongodb/

docker build -t dbhost:local dbhost/

docker build -t phpapp:local phpapp/

docker build -t phpapp18:local phpapp18/

docker build -t phpapp14:local phpapp14/

docker build -t lemp:local lemp/

docker build -t lemp18:local lemp18/

docker build -t nagios:local nagios/

docker build -t gemp:local gemp/

docker build -t gemp18:local gemp18/

docker build -t dbhost2:local dbhost2/

docker build -t lemp14:local lemp14/

docker build -t sender:local sender/
