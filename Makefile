INSTALL_DIR = installer/
PAM_DIR = quickshell/helpers/pam

install:
	git submodule update --init --recursive
	cd $(INSTALL_DIR) && make test
	cd $(PAM_DIR) && make

.PHONY: install
