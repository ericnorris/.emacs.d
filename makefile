all:

php-dev-env:
	ln -f -s ../includes/php-dev.el autoload/php-dev.el

etsy-chef-env: etsy-chef-env-deps
	ln -f -s ../includes/etsy-chef.el autoload/etsy-chef.el

python-dev-env:
	ln -f -s ../includes/python-dev.el autoload/python-dev.el

ocaml-dev-env:
	ln -f -s ../includes/ocaml-dev.el autoload/ocaml-dev.el

etsy-chef-env-deps: /opt/chef/embedded/bin/foodcritic
etsy-chef-env-deps: /opt/chef/embedded/bin/cookstyle

/opt/chef/embedded/bin/foodcritic:
	sudo /opt/chef/embedded/bin/gem install foodcritic

/opt/chef/embedded/bin/cookstyle:
	sudo /opt/chef/embedded/bin/gem install cookstyle
