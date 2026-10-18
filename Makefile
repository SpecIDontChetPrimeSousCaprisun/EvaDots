INSTALL_DIR = installer/
PAM_DIR = quickshell/helpers/pam

install:
	cd $(INSTALL_DIR) && make test
	cd $(PAM_DIR) && make

.PHONY: install
