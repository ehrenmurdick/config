function is_in_git_repo()
    git rev-parse HEAD >/dev/null 2>&1
end

function gf()
    is_in_git_repo &&
        git -c color.status=always status --short |
            fzf --height 40% -m --ansi --nth 2..,.. | awk '{print $2}'
end

function gb()
    is_in_git_repo &&
        git branch -a -vv --color=always | grep -v '/HEAD\s' |
            fzf --height 40% --ansi --multi --tac | sed 's/^..//' | awk '{print $1}' |
            sed 's#^remotes/[^/]*/##'
end

function gt()
    is_in_git_repo &&
        git tag --sort -version:refname |
            fzf --height 40% --multi
end

function gh()
    is_in_git_repo &&
        git log --date=short --format="%C(green)%C(bold)%cd %C(auto)%h%d %s (%an)" --graph |
            fzf --height 40% --ansi --no-sort --reverse --multi | grep -o '[a-f0-9]\{7,\}'
end

function gr()
    is_in_git_repo &&
        git remote -v | awk '{print $1 " " $2}' | uniq |
            fzf --height 40% --tac | awk '{print $1}'
end

