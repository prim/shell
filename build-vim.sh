
## 文件来源

## wget https://raw.githubusercontent.com/altercation/vim-colors-solarized/master/colors/solarized.vim
## wget https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

rm ~/.vim ~/.vimrc -rf

cp ./home/.vimrc ~

mkdir ~/.vim

mkdir ~/.vim/colors
cp ./home/.vim/colors/*.vim ~/.vim/colors

mkdir ~/.vim/autoload
cp ./home/.vim/autoload/*.vim ~/.vim/autoload

vim +PlugInstall +qall
