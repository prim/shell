
rm ~/.local/go -rf

rm build-go -rf
mkdir build-go
cd build-go

wget https://golang.org/dl/go1.16.4.linux-amd64.tar.gz
tar vzxf go1.16.4.linux-amd64.tar.gz

cp -r ./go ~/.local
~/.local/go/bin/go --version
