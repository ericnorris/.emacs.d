.PHONY: all update-git

FZF_INSTALL_FLAGS := --bin --no-key-bindings --no-completion --no-update-rc
FZF_INSTALL_FLAGS += --64

all: update-git fzf/bin/fzf

update-git:
	git pull && git submodule init && git submodule update

fzf/bin/fzf: fzf/install
	fzf/install $(FZF_INSTALL_FLAGS) && touch fzf/bin/fzf

.PHONY: php-dev-env chef-env

php-dev-env: all
	rm autoload/*
	ln -t autoload/ includes/php-dev.el

etsy-chef-env: all etsy-chef-env-deps
	rm -f autoload/*
	ln -t autoload/ includes/etsy-chef.el

.PHONY: etsy-chef-env-deps

etsy-chef-env-deps: /opt/chef/embedded/bin/foodcritic
etsy-chef-env-deps: /opt/chef/embedded/bin/cookstyle

/opt/chef/embedded/bin/foodcritic:
	sudo /opt/chef/embedded/bin/gem install foodcritic

/opt/chef/embedded/bin/cookstyle:
	sudo /opt/chef/embedded/bin/gem install cookstyle
