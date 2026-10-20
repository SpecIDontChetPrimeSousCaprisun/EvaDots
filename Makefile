INSTALL_DIR = installer/
PAM_DIR = quickshell/helpers/pam
BOOTLOADER_DIR = Evangelion

install:
	git submodule update --init --recursive
	cd $(INSTALL_DIR) && make test
	git clone https://aur.archlinux.org/yay.git
	cd yay && makepkg -si
	yay -S vesktop-bin
	cd $(PAM_DIR) && make
	cd $(BOOTLOADER_DIR) && sudo ./install.sh
	start-hyprland

.PHONY: install
