# PNPM
alias p="pnpm"
alias px="pnpm dlx"

# Maven
alias mci="mvn clean install"

# App dev
alias expobuild="echo 'Did you remember to update version and versionCode in app.json?' && read && expo build:ios && expo build:android"

alias flushdns="sudo dscacheutil -flushcache; sudo killall -HUP mDNSResponder; echo Flushed DNS" # Flush DNS

# Pipenv
alias pipenv="py -m pipenv"

# Python
alias py="python3"

pyclean () {
    find . -type f -name '*.py[co]' -delete -o -type d -name __pycache__ -delete
}

upload_ios_app() {
    xcrun altool --upload-app --type ios --file $1 --username $2 --password $3
}

alias devmenu_android="adb shell input keyevent 82"

alias code="open -a 'Visual Studio Code'"
alias intellij="open -a 'IntelliJ Idea'"

# Other

countlines() {
    # find ./src -name '*.ts*' | xargs wc -l 
    # Or use cloc --not-match-d=migrations .
    find $1 -name $2 | xargs wc -l
}

gitdifflines() {
    # Example: gitdifflines 7decf0640a83fb7921ae4242e9322fe8f00e4c2c 5a1c748c224faff37a521c379ac0b7a5a30bc015
    # 31 files changed, 1129 insertions(+), 223 deletions(-)
    git diff --stat $1 $2 | tail -n1
}

prop_to_env() {
    echo ${1//[.-]/_} | tr '[:lower:]' '[:upper:]'
}

git_delete_tags() {
    tags=$(git ls-remote --tags origin | grep "$1" | cut -f 2)
    
    echo "TAGS TO DELETE:\n$tags"
    echo -n "Press [Enter] to perform delete:"
    read
    
    git push origin --delete $tags
}
