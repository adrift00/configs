if [ -L ~/.tmux.conf ]; then
    rm ~/.tmux.conf
fi
if [ -f ~/.tmux.conf ]; then
    mv ~/.tmux.conf ~/.tmux.conf.bak
fi
ln -s ~/configs/.tmux.conf ~/.tmux.conf

if [ -L ~/.tmux ]; then
    rm ~/.tmux
fi
if [ -d ~/.tmux ]; then
    mv ~/.tmux ~/.tmux.bak
fi
ln -s ~/configs/.tmux ~/.tmux

# clone tpm plugin
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

#
tmux source ~/.tmux.conf

# install tmux plugins
# Press prefix + I (capital i, as in Install) to fetch the plugin.

# vim configs
if [ -L ~/.vimrc ]; then
    rm ~/.vimrc
fi
if [ -f ~/.vimrc ]; then
    mv ~/.vimrc ~/.vimrc.bak
fi
ln -s ~/configs/.vimrc ~/.vimrc

# the vim-plug is in autoload/plug.vim now, so needn't to download it
# curl -fLo ~/configs/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

if [ -L ~/.vim ]; then
    rm ~/.vim
fi
if [ -d ~/.vim ]; then
    mv ~/.vim ~/.vim.bak
fi
ln -s ~/configs/.vim ~/.vim
# use :PlugInstall to install vim plugins
