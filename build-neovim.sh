
## 文件来源
## wget https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

rm ~/.config/nvim -rf
rm ~/.vim -rf

mkdir -p ~/.config/nvim
cp ./home/.config/nvim/init.vim ~/.config/nvim

mkdir -p ~/.local/share/nvim/site/autoload
cp ./home/.vim/autoload/plug.vim ~/.local/share/nvim/site/autoload

rm build-neovim -rf
mkdir build-neovim
cd build-neovim

wget https://github.com/neovim/neovim/releases/download/nightly/nvim.appimage
chmod +x nvim.appimage
./nvim.appimage --appimage-extract
mv squashfs-root/ nvim
cp ./nvim/AppRun ./nvim/nvim

mkdir ~/.local
cp -r ./nvim ~/.local

pip install pynvim --user

~/.local/nvim/nvim +PlugInstall +qall
~/.local/nvim/nvim +PlugUpdate +qall
~/.local/nvim/nvim +UpdateRemotePlugins +qall

