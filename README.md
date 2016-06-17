# .vim
My personal vim setup

Installation
------------

To use on a mac:

    brew install Caskroom/cask/xquartz
    brew install vim --override-system-vi --with-client-server --with-lua --with-mzscheme --with-tcl
    brew install git
    brew install ctags-exuberant
    brew install scalariform
    brew install scalastyle
    brew install scala210
    brew install python
    brew install the_silver_searcher
    git clone https://github.com/aberey/.vim ~/.vim
    git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
    vim +BundleInstall +qall

    // for ensime-vim:
    run make in .vim/bundle/vimproc/
    pip install websocket-client sexpdata


