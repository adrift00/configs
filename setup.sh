ln -s ~/configs/.tmux.conf ~/.tmux.conf
ln -s ~/configs/.tmux ~/.tmux

# init tpm plugin
git submodule init
git submodule update

#
source ~/.tmux.conf
# install tmux plugins
~/.tmux/plugins/tpm/bin/install_plugins

# vim configs
ln -s ~/configs/.vimrc ~/.vimrc

# download vim-plug
curl -fLo ~/configs/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
ln -s ~/confing/.vim ~/.vim



