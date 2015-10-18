SHELL=/bin/sh
MAKEFILE_PATH=$(dir $(realpath $(lastword $(MAKEFILE_LIST))))
VIM_PLUG_PATH=~/.vim/autoload/plug.vim
VIM_PLUG_URL="https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim"
VIMRC_PATH=~/.vimrc
GVIMRC_PATH=~/.gvimrc

.PHONY: setup
setup: download link_rc plug_install

.PHONY: download
download:
	curl -fLo $(VIM_PLUG_PATH) --create-dirs $(VIM_PLUG_URL)

.PHONY: link_rc
link_rc:
	ln --backup --force --symbolic $(MAKEFILE_PATH)vimrc $(VIMRC_PATH)
	ln --backup --force --symbolic $(MAKEFILE_PATH)gvimrc $(GVIMRC_PATH)

.PHONY: plug_install
plug_install:
	vim +PlugInstall +qall

.PHONY: clean
clean:
	rm -rfv ~/.vim/plugged $(VIM_PLUG_PATH)
