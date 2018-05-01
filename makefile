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

chef-env: all
	rm -f autoload/*
	ln -t autoload/ includes/etsy-chef
