# -*- mode: ruby -*-
# vi: set ft=ruby :

DOKKU_DOMAIN = ENV["DOKKU_DOMAIN"] || "dokku.me"
DOKKU_IP = ENV["DOKKU_IP"] || "10.0.0.2"

Vagrant.configure(2) do |config|
  config.vm.box = "ubuntu/trusty64"
  config.vm.synced_folder File.dirname(__FILE__), "/root/dokku"
  config.vm.network :forwarded_port, guest: 80, host: 8080
  config.vm.hostname = "#{DOKKU_DOMAIN}"
  config.vm.network :private_network, ip: DOKKU_IP
  config.vm.provider :virtualbox do |vb|
    vb.customize ["modifyvm", :id, "--natdnshostresolver1", "on"]
  end
end
