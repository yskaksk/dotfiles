sourcedir='/Users/yosukeakasaka/Documents/github/vim'

cd $sourcedir

./configure --with-futures=huge --enable-python3interp=yes --enable-luainterp=yes --enable-terminal=yes --enable-if-missing=yes
make
sudo make install
