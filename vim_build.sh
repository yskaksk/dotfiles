sourcedir='/Users/yosukeakasaka/Documents/github/vim'

cd $sourcedir

./configure --with-features=huge --enable-python3interp=yes --enable-luainterp=yes --enable-terminal=yes --enable-fail-if-missing=yes
make
sudo make install
