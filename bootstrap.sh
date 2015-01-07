#!/usr/bin/env bash

vagrant up
vagrant ssh -- "wget -qO- https://raw.github.com/progrium/dokku/v0.3.12/bootstrap.sh | sudo DOKKU_TAG=v0.3.12 bash"

cat ~/.ssh/id_rsa.pub | vagrant ssh -- sudo sshcommand acl-add dokku ${USER}

vagrant ssh -- "sudo /vagrant/install.d/postinstall.sh"
vagrant reload

vagrant ssh -- "dokku postgresql:start"

if [ $(cat /etc/hosts | grep '\sdokku.me' | wc -l) -eq 0 ]; then
    echo "10.0.0.2   dokku.me" | sudo tee -a /etc/hosts >/dev/null
fi

ssh-keygen -f "${HOME}/.ssh/known_hosts" -R dokku.me
ssh -o StrictHostKeyChecking=no dokku@dokku.me postgresql:status

git remote add dokku dokku@dokku.me:vagrant-dokku-pg-java
git push dokku master

date

