# リポジトリのルートで実行する
make clean && \
./configure --with-features=huge \
            --with-compiledby=yskaksk \
            --enable-pythoninterp=no \
            --enable-python3interp=yes --with-python3-command=`which python3` \
            --enable-terminal=yes \
            --enable-multibyte \
            --enable-fail-if-missing=yes
make
sudo make install
