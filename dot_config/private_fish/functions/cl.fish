function cl --description 'Create a lesson folder, files and notes for LCTHW'
    mkdir $argv[1]
    cd $argv[1]
    touch $argv[1].c lesson_notes.md
end
