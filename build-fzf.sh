# 最终增加 ~/.fzf 会增加 ~/.fzf.bash

rm ~/.fzf -rf
rm ~/.fzf.bash

mkdir build-fzf
cd build-fzf

wget https://github.com/junegunn/fzf/archive/refs/tags/0.27.1.tar.gz
tar vzxf 0.27.1.tar.gz
mv ./fzf-0.27.1/ ~/.fzf
~/.fzf/install

