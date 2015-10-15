
RM = rm -rfd
CP = cp
CHMOD = chmod
MKDIR = mkdir -p
VENDOR = vendor
COMPOSER = ./composer.phar
COMPOSER_DEV ?= 
COMPOSER_INTERACTION ?= --no-interaction
COMPOSER_PREFER_SOURCE ?= 


.PHONY: all
all: install

.PHONY: install
install: $(VENDOR) lib/presist-js
	@echo 'install done'

.PHONY: update
update: $(COMPOSER)
	$(COMPOSER) selfupdate
	$(COMPOSER) update

.PHONY: clean
clean:
	$(RM) composer.lock $(COMPOSER)
	$(RM) vendor/*
	$(RM) vendor

$(VENDOR): $(COMPOSER)
	$(COMPOSER) install $(COMPOSER_PREFER_SOURCE) $(COMPOSER_INTERACTION) $(COMPOSER_DEV)

$(COMPOSER):
	curl -sS https://getcomposer.org/installer | php
	$(CHMOD) u=rwx,go=rx $(COMPOSER)

lib:
	$(MKDIR) $@

lib/presist-js: lib
	cd lib; \
	git clone https://github.com/jeremydurham/persist-js.git
