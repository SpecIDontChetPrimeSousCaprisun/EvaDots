INSTALL_DIR = installer/

install:
	cd $(INSTALL_DIR) && make test

.PHONY: install
