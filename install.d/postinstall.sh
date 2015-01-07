#!/bin/bash

apt-get -y install htop apg

apg -m 12 -x 12 -n 1 > 

/vagrant/install.d/02-postgresql-single

usermod -a -G docker vagrant

dokku postgresql:start

### testing env
dokku apps:create vagrant-dokku-pg-java
dokku postgresql:create vagrant-dokku-pg-java
###
