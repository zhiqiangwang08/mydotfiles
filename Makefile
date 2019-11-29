#### setup neovim
TOP=.
setup: setupNeovim
setupNeovim: setupDir installPlugManager installNeoConfig
setupDir: 
	@echo $@ 
	@if [ ! -d ~/.config ]; then mkdir ~/.config; fi
	@if [ ! -d  ~/.local/share/nvim/site/autoload/ ]; then mkdir -p  ~/.local/share/nvim/site/autoload/ 2>/dev/null; fi

installPlugManager: 
	@echo $@ 
	@curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

installNeoConfig: 
	@echo $@ 
	@cp -r $(TOP)/.config/nvim ~/.config/







