os = $(shell uname | awk '{print tolower($$0)}')
$(info os=$(os))

.PHONY: install clean $(NV_ACTIONS)

install: before_install install_bashrc install_vimrc install_tmux_conf install_kitty_conf install_ansible_conf install_git_conf \
		install_lazygit_conf install_jupyter_lab_user_settings install_xournal_config \
		install_nvim_old_conf

before_install:
	mkdir -p ~/.config


install_bashrc:
	@echo "Installing bashrc..."
	ln -sf ~/.dotfiles/.bashrc ~/
	test -f ~/.dotfiles/.bashrc.${os}.sh && ln -sf ~/.dotfiles/.bashrc.${os}.sh ~/ || true

install_vimrc:
	@echo "Installing vimrc..."
	ln -sf ~/.dotfiles/.vimrc ~/

install_tmux_conf:
	@echo "Installing tmux config..."
	ln -sf ~/.dotfiles/.tmux.conf ~/
	test -f ~/.dotfiles/.tmux.conf.${os} && ln -sf ~/.dotfiles/.tmux.conf.${os} ~/ || true
	ln -sf ~/.dotfiles/.tmux.conf.sh ~/

install_tmux_old_conf:
	@echo "Installing tmux old config..."
	ln -sf ~/.dotfiles/old/.tmux.old.conf ~/.tmux.conf
	ln -sf ~/.dotfiles/old/.tmux.old.conf.local ~/.tmux.conf.local

install_kitty_conf:
	@echo "Installing kitty config..."
	rm -rf ~/.config/kitty
	ln -sf ~/.dotfiles/kitty ~/.config/

install_ansible_conf:
	@echo "Installing ansible config..."
	mkdir -p ~/.ansible/roles
	ln -sf ~/.dotfiles/.ansible.cfg ~/
	ln -sf ~/.dotfiles/.ansible.example.cfg ~/
	ln -sf ~/.dotfiles/.ansible_hosts ~/

gitconfig = $(shell touch /etc/gitconfig; git -c core.editor="ls" config --system -e 2>/dev/null)
my_gitconfig_absolute = $(HOME)/.dotfiles/etc/gitconfig
install_git_conf:
	@echo "Installing git config..."
	@echo $(gitconfig)
	@echo $(my_gitconfig_absolute)
	@test "$(gitconfig)" != "$(my_gitconfig_absolute)" && ln -sf $(my_gitconfig_absolute) $(gitconfig) || true

LAZYGIT_CONF_DIR_MAC = ~/Library/"Application Support"/lazygit/
LAZYGIT_CONF_DIR_LINUX = ~/.config/lazygit/
install_lazygit_conf:
	@echo "Installing lazygit config..."
	@test -d $(LAZYGIT_CONF_DIR_MAC) && echo $(LAZYGIT_CONF_DIR_MAC) && ln -sf ~/.dotfiles/lazygit/config.yml $(LAZYGIT_CONF_DIR_MAC)/ || true
	@test -d $(LAZYGIT_CONF_DIR_LINUX) && echo $(LAZYGIT_CONF_DIR_LINUX) && ln -sf ~/.dotfiles/lazygit/config.yml $(LAZYGIT_CONF_DIR_LINUX)/ || true

install_jupyter_lab_user_settings:
	@echo "Installing jupyter lab user settings..."
	mkdir -p ~/.jupyter/lab
	rm -rf ~/.jupyter/lab/user-settings
	ln -sf ~/.dotfiles/jupyter/lab/user-settings ~/.jupyter/lab/

install_xournal_config:
	@echo "Installing xournal config..."
	mkdir -p ~/.xournal
	ln -sf ~/.dotfiles/xournal/config ~/.xournal/

# sticking to old conf
install_nvim_conf: install_nvim_old_conf
# @echo "Installing nvim config..."
# ln -sf ~/.dotfiles/nvim ~/.config/

install_nvim_old_conf:
	@echo "Installing nvim old config..."
	@echo "[WARN] This config only works for [NVIM 0.7]."
	ln -sf ~/.dotfiles/old/nvim ~/.config/


# =================================== dev ===================================
NVIM_ACTIONS = release reset update upgrade
# sticking to old conf
$(NVIM_ACTIONS):
	cd $(OLD_NVIM_DIR) && ./build.sh $@


# ================================ dev (old) ================================
OLD_NVIM_DIR = old/nvim
OLD_NVIM_TARGETS = $(addprefix old_nvim_,$(NVIM_ACTIONS))

old_nvim_%:
$(OLD_NVIM_TARGETS): old_nvim_%:
	@echo $@
	@echo $*
	cd $(OLD_NVIM_DIR) && ./build.sh $*


# ================================== clean ==================================
clean: clean_nvim_conf

clean_nvim_conf:
	@echo "Cleaning nvim config..."
	rm -rf ~/.config/nvim/plugin
	rm -rf ~/.config/nvim
	rm -rf ~/.local/share/nvim
	rm -rf ~/.cache/nvim
