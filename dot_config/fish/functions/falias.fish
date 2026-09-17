function falias --description 'Search abbreviations and functions with fzf and run the choice'
    set -l chosen (
        begin
            abbr --show | string replace -r '^abbr -a -- ' ''
            functions --names | string match -v -r '^_'
        end | fzf | string split -m1 ' ' | head -1
    )
    test -n "$chosen" && commandline -r -- $chosen
end
