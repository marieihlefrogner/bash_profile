alias showhidden="defaults write com.apple.finder AppleShowAllFiles YES; killall Finder /System/Library/CoreServices/Finder.app"
alias hidehidden="defaults write com.apple.finder AppleShowAllFiles NO; killall Finder /System/Library/CoreServices/Finder.app"

alias reindexspotlight="sudo mdutil -E /"
alias largestfiles="sudo du -ah / 2>/dev/null | sort -n -r | head -n 30"
alias checkspace="sudo du -d 1 -x -c -g" # then directory

# fixes stray unicode characters in file
fixstrayf() {
        [ $# -lt 1 ] && return
        iconv -c -f utf-8 -t ascii $1 > tmp.txt
        mv -f tmp.txt $1
}

realpath() {
 	python3 -c "import os.path; print(os.path.relpath('$1', '$2'))"
}

greps() {
	[ $# -lt 2 ] && echo "Usage: greps <string> <location>" && return
	echo ">> Searching for '$1' in '$2'"
	grep -RIn $1 $2
}
