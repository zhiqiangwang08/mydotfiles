#### setup neovim
TOP=.
TOPDIR=$(dir $(realpath $(firstword $(MAKEFILE_LIST))))
VIMCON=$(TOPDIR)/neovim/.config/nvim
setup: setupNeovim
setupNeovim: setupDir installNeoConfig installPlugManager installSilverSearch installRipgrep
setupDir: 
	@echo $@ 
	@if [ ! -d ~/.config ]; then mkdir ~/.config; fi
	@if [ ! -d  ~/.local/share/nvim/site/autoload/ ]; then mkdir -p  ~/.local/share/nvim/site/autoload/ 2>/dev/null; fi

installPlugManager: 
	@echo $@ 
	@curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs "https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim"

#	@cp -r $(TOP)/.config/nvim ~/.config/
#
installNeoConfig: 
	@echo $@ 
	@ln -s -f $(VIMCON) ~/.config/

installSilverSearch:
	@echo $@ 
	@sudo yum install  -y the_silver_searcher


installRipgrep:
	@echo $@ 
	@yum-config-manager --add-repo=https://copr.fedorainfracloud.org/coprs/carlwgeorge/ripgrep/repo/epel-7/carlwgeorge-ripgrep-epel-7.repo
	@sudo yum install -y ripgrep

pwd:
	@echo ${TOPDIR}




