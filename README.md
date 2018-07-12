# install luarocks

```
cd ~/workspace
wget http://luarocks.github.io/luarocks/releases/luarocks-2.4.4.tar.gz
tar xzf luarocks*.tar.gz
cd luarocks-2.4.4
./configure --lua-suffix=jit --with-lua-include=/usr/local/include/luajit-2.0/
make build
make install
```
