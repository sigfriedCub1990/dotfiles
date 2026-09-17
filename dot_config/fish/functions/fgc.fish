function fgc --description 'Pick changed files with fzf and print their paths'
    __fish_is_git_repository || return 1

    git -c color.status=always status --short \
        | _fzf_down -m --ansi --nth 2..,.. \
            --preview '(git diff --color=always -- {-1} | sed 1,4d; cat {-1}) | head -500' \
        | cut -c4- | sed 's/.* -> //'
end
