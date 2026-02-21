e() {
  if [ $# -eq 0 ]; then
    nvim .
  else
    nvim "${1:-.}"
  fi
}

# Delete branches that have been squashed and merged into master (https://github.com/not-an-aardvark/git-delete-squashed)
gdelsquashed() {
  git checkout -q master && git for-each-ref refs/heads/ "--format=%(refname:short)" | while read branch; do mergeBase=$(git merge-base master $branch) && [[ $(git cherry master $(git commit-tree $(git rev-parse $branch^{tree}) -p $mergeBase -m _)) == "-"* ]] && git branch -D $branch; done
}

# bin <binary>. Move <binary> to /usr/local/bin (in my PATH).
bin(){
  mv "$@" /usr/local/bin
}


findEmptyDirsAndFiles(){
  find . -type f -exec bash -c 'if [ `cat "{}" |wc -w` -eq 0 ]; then echo "file - {}";fi' \; -or -empty -exec bash -c "echo dir - {}" \;
}

convertAllMDFilesToTabs(){
 find . -name '*.md' ! -type d -exec bash -c 'expand -t 4 "$0" > /tmp/e && mv /tmp/e "$0"' {} \;
}

j(){
  if [ $# -eq 0 ]; then
    yarn
  else
    yarn "$@"
  fi
}

# Search aliases/functions
falias() {
    CMD=$(
        (
            (alias)
            (functions | grep "()" | cut -d ' ' -f1 | grep -v "^_" )
        ) | fzf | cut -d '=' -f1
    );

    eval $CMD
}

# Lowercase every file in current dir
lowercaseCurrentDir(){
  for i in *; do mv $i ${(L)i}; done
}

# Show $PATH
path(){
  echo -e ${PATH//:/\\n}
}

# Show stuff in $FPATH
fpath() {
    echo $fpath | awk '{
        for (i = 1; i < NF; i++) {
            print $i
        }
    }'
}

# md <folder-name> - Create folder and cd to it
md(){
  mkdir "$1"
  cd "$1"
}

# cfile <file> - Copy content of file to clipboard
cfile(){
  cat $1 | xclip
}

# dirfiles <dir> - Give number of files found inside given directory.
dirfiles() {
    find "$1" -type f | wc -l
}

# fl <text> - Find where <text> is contained within current dir.
fl() {
    grep -rnw . -e "$*"
}

# down <url> - Download <url> and save to current dir.
down(){
    curl -O "$1"
}

# cw - Copy working dir.
cw() { printf %s "$PWD" | pbcopy; }

# server - Create server of current dir on port 8000 and open it in browser.
server() {
	local port="${1:-8000}"
    sleep 1 && xdg-open "http://localhost:$port" &
    python -m  "http.server" "$port"
}

# compress <file/dir> - Compress <file/dir>.
compress() {
    dirPriorToExe=`pwd`
    dirName=`dirname $1`
    baseName=`basename $1`

    if [ -f $1 ] ; then
      echo "It was a file change directory to $dirName"
      cd $dirName
      case $2 in
        tar.bz2)
          tar cjf $baseName.tar.bz2 $baseName
          ;;
        tar.gz)
          tar czf $baseName.tar.gz $baseName
          ;;
        gz)
          gzip $baseName
          ;;
        tar)
          tar -cvvf $baseName.tar $baseName
          ;;
        zip)
          zip -r $baseName.zip $baseName
          ;;
        *)
          echo "Method not passed compressing using tar.bz2"
          tar cjf $baseName.tar.bz2 $baseName
          ;;
      esac
      echo "Back to Directory $dirPriorToExe"
      cd $dirPriorToExe
    else
      if [ -d $1 ] ; then
        echo "It was a Directory change directory to $dirName"
        cd $dirName
        case $2 in
          tar.bz2)
            tar cjf $baseName.tar.bz2 $baseName
            ;;
          tar.gz)
            tar czf $baseName.tar.gz $baseName
            ;;
          gz)
            gzip -r $baseName
            ;;
          tar)
            tar -cvvf $baseName.tar $baseName
            ;;
          zip)
            zip -r $baseName.zip $baseName
            ;;
          *)
            echo "Method not passed compressing using tar.bz2"
            tar cjf $baseName.tar.bz2 $baseName
            ;;
        esac
        echo "Back to Directory $dirPriorToExe"
        cd $dirPriorToExe
      else
        echo "'$1' is not a valid file/folder"
      fi
    fi
    echo "Done"
    echo "###########################################"
  }

# extract <file.tar> - Extract <file.tar>.
extract() {
  local remove_archive
  local success
  local file_name
  local extract_dir

  if (( $# == 0 )); then
    echo "Usage: extract [-option] [file ...]"
    echo
    echo Options:
    echo "    -r, --remove    Remove archive."
  fi

  remove_archive=1
  if [[ "$1" == "-r" ]] || [[ "$1" == "--remove" ]]; then
    remove_archive=0
    shift
  fi

  while (( $# > 0 )); do
    if [[ ! -f "$1" ]]; then
      echo "extract: '$1' is not a valid file" 1>&2
      shift
      continue
    fi

    success=0
    file_name="$( basename "$1" )"
    extract_dir="$( echo "$file_name" | sed "s/\.${1##*.}//g" )"
    case "$1" in
      (*.tar.gz|*.tgz) [ -z $commands[pigz] ] && tar zxvf "$1" || pigz -dc "$1" | tar xv ;;
      (*.tar.bz2|*.tbz|*.tbz2) tar xvjf "$1" ;;
      (*.tar.xz|*.txz) tar --xz --help &> /dev/null \
        && tar --xz -xvf "$1" \
        || xzcat "$1" | tar xvf - ;;
    (*.tar.zma|*.tlz) tar --lzma --help &> /dev/null \
      && tar --lzma -xvf "$1" \
      || lzcat "$1" | tar xvf - ;;
  (*.tar) tar xvf "$1" ;;
  (*.gz) [ -z $commands[pigz] ] && gunzip "$1" || pigz -d "$1" ;;
  (*.bz2) bunzip2 "$1" ;;
  (*.xz) unxz "$1" ;;
  (*.lzma) unlzma "$1" ;;
  (*.Z) uncompress "$1" ;;
  (*.zip|*.war|*.jar|*.sublime-package) unzip "$1" -d $extract_dir ;;
  (*.rar) unrar x -ad "$1" ;;
  (*.7z) 7za x "$1" ;;
  (*.deb)
    mkdir -p "$extract_dir/control"
    mkdir -p "$extract_dir/data"
    cd "$extract_dir"; ar vx "../${1}" > /dev/null
    cd control; tar xzvf ../control.tar.gz
    cd ../data; tar xzvf ../data.tar.gz
    cd ..; rm *.tar.gz debian-binary
    cd ..
    ;;
  (*)
    echo "extract: '$1' cannot be extracted" 1>&2
    success=1
    ;;
esac

(( success = $success > 0 ? $success : $? ))
(( $success == 0 )) && (( $remove_archive == 0 )) && rm "$1"
shift
  done
}

# List commit hashes
commits() {
  git log $1 --oneline --reverse | cut -d' ' -f 1 | tr '/n' ' '
}

# ram <process-name> - Find how much RAM a process is taking.
ram() {
  local sum
  local items
  local app="$1"
  if [ -z "$app" ]; then
    echo "First argument - pattern to grep from processes"
  else
    sum=0
    for i in `ps aux | grep -i "$app" | grep -v "grep" | awk '{print $6}'`; do
      sum=$(($i + $sum))
    done
    sum=$(echo "scale=2; $sum / 1024.0" | bc)
    if [[ $sum != "0" ]]; then
      echo "${fg[blue]}${app}${reset_color} uses ${fg[green]}${sum}${reset_color} MBs of RAM."
    else
      echo "There are no processes with pattern '${fg[blue]}${app}${reset_color}' are running."
    fi
  fi
}

# Connect to a tmux session over ssh
sst() {
    if [ -z "$1" ] || [ -z "$2" ]; then
        echo "Usage: $0 <host> <tmux session>"
        return 1
    fi
    ssh -t "$1" "tmux attach -t '$2'"
}

# Reload a completion function from ZSH
rc() {
    if [ -z "$1" ]; then
        echo "Usage: $0 <completion to reload>"
        return 1
    fi
    unfunction "$1"
    autoload -U "$1"
}

f() {
    fd --type directory | fzf --multi --height=80% --border=sharp --exit-0 \
    --preview='tree -C {}' --preview-window='45%,border-sharp' \
    --prompt='Dirs > ' \
    --bind='enter:execute($EDITOR {+})' \
    --bind='del:execute(rm -ri {+})' \
    --bind='ctrl-p:toggle-preview' \
    --bind='ctrl-d:change-prompt(Dirs > )' \
    --bind='ctrl-d:+reload(fd --type directory)' \
    --bind='ctrl-d:+change-preview(tree -C {})' \
    --bind='ctrl-d:+refresh-preview' \
    --bind='ctrl-f:change-prompt(Files > )' \
    --bind='ctrl-f:+reload(fd --type file)' \
    --bind='ctrl-f:+change-preview(cat {})' \
    --bind='ctrl-f:+refresh-preview' \
    --bind='ctrl-a:select-all' \
    --bind='ctrl-x:deselect-all' \
    --header '
    CTRL-D to display directories | CTRL-F to display files
    CTRL-A to select all | CTRL-x to deselect all
    ENTER to edit | DEL to delete
    CTRL-P to toggle preview
    '
}

fe() {
  IFS=$'\n' files=($(fzf-tmux --query="$1" --multi --select-1 --exit-0))
  [[ -n "$files" ]] && ${EDITOR:-vim} "${files[@]}"
}

activate() {
    if [ -d ".venv" ]; then
        source ".venv/bin/activate"
        return
    fi

    if [ -d "venv" ]; then
        source "venv/bin/activate"
        return
    fi

    echo "Virtualenv not found, create one by running 'python -m venv venv'"
}

function y() {
	local tmp="$(mktemp -t "yazi-cwd.XXXXXX")" cwd
	command yazi "$@" --cwd-file="$tmp"
	IFS= read -r -d '' cwd < "$tmp"
	[ "$cwd" != "$PWD" ] && [ -d "$cwd" ] && builtin cd -- "$cwd"
	rm -f -- "$tmp"
}
