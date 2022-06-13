os = $(shell uname | awk '{print tolower($0)}')
.PHONY: all install clean $(NV_ACTIONS)


all: install install_git_conf install_nvim_conf


# =================================== dotfiles ===================================
install: install_bashrc install_vimrc install_tmux_conf install_lazygit_conf

install_bashrc:
	@echo "Installing bashrc..."
	ln -sf ~/.dotfiles/.bashrc ~/
	ln -sf ~/.dotfiles/.bashrc.${os} ~/

install_vimrc:
	@echo "Installing vimrc..."
	ln -sf ~/.dotfiles/.vimrc ~/

install_tmux_conf:
	@echo "Installing tmux config..."
	ln -sf ~/.dotfiles/.tmux.conf ~/
	ln -sf ~/.dotfiles/.tmux.conf.local ~/

LAZYGIT_CONF_DIR_MAC = ~/Library/"Application Support"/lazygit/
LAZYGIT_CONF_DIR_LINUX = ~/.config/lazygit/
install_lazygit_conf:
	@echo "Installing lazygit config..."
	@test -d $(LAZYGIT_CONF_DIR_MAC) && echo $(LAZYGIT_CONF_DIR_MAC) && ln -sf ~/.dotfiles/lazygit/config.yml $(LAZYGIT_CONF_DIR_MAC)/ || true
	@test -d $(LAZYGIT_CONF_DIR_LINUX) && echo $(LAZYGIT_CONF_DIR_LINUX) && ln -sf ~/.dotfiles/lazygit/config.yml $(LAZYGIT_CONF_DIR_LINUX)/ || true


# ======================== gitconfig (require root access) ========================
install_git_conf:
	@echo "Installing git config... (require root access)"
	sudo ln -sf ~/.dotfiles/etc/gitconfig /etc/


# ================================== nvim config ==================================
install_nvim_conf: clean_nvim_conf
	@echo "Installing nvim config..."
	ln -sf ~/.dotfiles/nvim ~/.config/
	nvim



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
