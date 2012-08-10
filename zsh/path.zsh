function add () {
  export PATH=$1:$PATH
}

add $HOME/bin/
add $HOME/.cabal/bin
add /usr/local/share/npm/bin
add /usr/local/bin
add /usr/local/sbin

export GOROOT=/usr/local/Cellar/go/1
add $GOROOT/bin
