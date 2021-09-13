function newpass
    set tmp (mktemp)
    xkcdpass -n4 >$tmp
    echo (basename $argv)@ehren.io >> $tmp
    pass insert -m $argv < $tmp
    pass edit $argv
    rm $tmp
end
