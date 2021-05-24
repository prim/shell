# 最终增加 ~/.fzf 会增加 ~/.local/tmux
rm ~/.local/tmux -rf

rm build-tmux -rf
mkdir build-tmux
cd build-tmux

wget https://github.com/tmux/tmux/releases/download/3.1b/tmux-3.1b-x86_64.AppImage
chmod +x tmux-3.1b-x86_64.AppImage
./tmux-3.1b-x86_64.AppImage --appimage-extract
mv squashfs-root/ tmux
cp ./tmux/AppRun ./tmux/tmux

mkdir ~/.local
cp -r ./tmux ~/.local

~/.local/tmux/tmux --help


