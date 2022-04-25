
rm ~/.local/go -rf

rm build-go -rf
mkdir build-go
cd build-go

wget https://go.dev/dl/go1.18.1.linux-amd64.tar.gz
tar vzxf go1.18.1.linux-amd64.tar.gz

cp -r ./go ~/.local
~/.local/go/bin/go --version
