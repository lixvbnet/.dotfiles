install: install_tmux_conf install_nvim_conf

install_tmux_conf:
	@echo "Installing tmux config..."
	ln -sf ~/.dotfiles/.tmux.conf ~/
	ln -sf ~/.dotfiles/.tmux.conf.local ~/

install_nvim_conf: clean_nvim_conf
	@echo "Installing nvim config..."
	ln -sf ~/.dotfiles/nvim ~/.config/
	nvim +'hi NormalFloat guibg=#1e222a' +PackerSync



clean: clean_nvim_conf

clean_nvim_conf:
	@echo "Cleaning nvim config..."
	rm -rf ~/.config/nvim/plugin
	rm -rf ~/.config/nvim
	rm -rf ~/.local/share/nvim
	rm -rf ~/.cache/nvim


# =================================== dev ====================================
NV_DIR = nvim
NV_ACTIONS = release reset update upgrade

$(NV_ACTIONS):
	cd $(NV_DIR) && ./build.sh $@
