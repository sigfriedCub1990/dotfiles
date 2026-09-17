function md_tabs --description 'Expand tabs to 4 spaces in every Markdown file below the current directory'
    for file in (find . -name '*.md' -type f)
        set -l tmp (mktemp)
        expand -t 4 $file >$tmp && mv $tmp $file
    end
end
