function trash
  set tmpdir (mktemp -d)

  mv $argv $tmpdir

  echo $tmpdir
end

