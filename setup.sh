if [ -f ~/.tmux.conf ]; then
    mv ~/.tmux.conf ~/.tmux.conf.bak
fi
ln -s ~/configs/.tmux.conf ~/.tmux.conf

if [ -d ~/.tmux ]; then
    mv ~/.tmux ~/.tmux.bak
fi
ln -s ~/configs/.tmux ~/.tmux

# init tpm plugin
git submodule update --init --recursive

#
tmux source ~/.tmux.conf
# install tmux plugins
# Press prefix + I (capital i, as in Install) to fetch the plugin.

# vim configs
if [ -f ~/.vimrc ]; then
    mv ~/.vimrc ~/.vimrc.bak
fi
ln -s ~/configs/.vimrc ~/.vimrc

# download vim-plug
curl -fLo ~/configs/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
if [ -d ~/.vim ]; then
    mv ~/.vim ~/.vim.bak
fi
ln -s ~/configs/.vim ~/.vim
# use :PlugInstall to install vim plugins



