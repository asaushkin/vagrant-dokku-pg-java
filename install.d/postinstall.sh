#!/bin/bash

apt-get -qq -y install htop 

/vagrant/install.d/02-postgresql-single

usermod -a -G docker vagrant

dokku postgresql:start

### testing env
dokku apps:create vagrant-dokku-pg-java
dokku postgresql:create vagrant-dokku-pg-java
###
