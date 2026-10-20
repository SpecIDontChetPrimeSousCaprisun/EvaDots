INSTALL_DIR = installer/
PAM_DIR = quickshell/helpers/pam
BOOTLOADER_DIR = Evangelion

install:
	git submodule update --init --recursive
	cd $(INSTALL_DIR) && make test
	cd $(PAM_DIR) && make
	cd $(BOOTLOADER_DIR) && sudo ./install.sh

.PHONY: install
