#!/usr/bin/env bash

vagrant up
vagrant ssh -- "wget -qO- https://raw.github.com/progrium/dokku/v0.3.12/bootstrap.sh | sudo DOKKU_TAG=v0.3.12 bash"

cat ~/.ssh/id_rsa.pub | vagrant ssh -- sudo sshcommand acl-add dokku ${USER}

vagrant ssh -- "sudo /vagrant/install.d/postinstall.sh"
vagrant reload

vagrant ssh -- "dokku postgresql:start"

echo "10.0.0.2   dokku.me" | sudo tee -a /etc/hosts >/dev/null

ssh -o StrictHostKeyChecking=no dokku@dokku.me postgresql:status

git remote add dokku dokku@dokku.me:vagrant-dokku-pg-java
git push dokku master

date

