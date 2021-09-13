function installmod
  echo "installing $argv[1]"

  if unzip -l $argv[1] | grep -q -E "\s*GameData\/"
    echo has GameData...
    echo cd /usr/local/games/KSP_linux
    cd /usr/local/games/KSP_linux

    echo "unzip $argv[1]"
    unzip $HOME/Downloads/$argv[1]

    cd -
  end
end
