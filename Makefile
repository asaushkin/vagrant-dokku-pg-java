deploy:
	@git push dokku master

logs:
	@ssh -i ~/.vagrant.d/insecure_private_key vagrant@dokku.me sudo dokku logs vagrant-dokku-pg-java

test:
	@curl -sL http://vagrant-dokku-pg-java.dokku.me\?echo+"It+works\!" | bash
