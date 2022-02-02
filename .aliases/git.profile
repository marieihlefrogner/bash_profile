alias st="git status"
#alias cmt="git commit -am"
alias gp="git pull"
alias gamend="git commit --amend"
alias gitignore="echo .DS_Store > .gitignore"
alias gitrevert_force_hard="git clean --force && git reset --hard"
alias gremotes="git remote -v"
alias gitreset="git checkout HEAD --"
alias gch="git checkout"
alias gpush="git push -u origin HEAD"

function gitcheckoutpull() {
    git fetch && git checkout $1 && git pull origin $1
}

function cmt() {
    a=$(git grep -In 'REVERT_BEFORE_COMMIT' | wc -l | xargs); 
    
    if [ "$a" -eq "0" ]; then
        #echo "REVERT_BEFORE_COMMIT not found"
        git commit -am $1
    else
	git grep -In 'REVERT_BEFORE_COMMIT'
        echo "REVERT_BEFORE_COMMIT found. Please remove."
    fi
}

function gitrewriteauthor() {
    EMAIL=$1
    NAME=$2

    read "response?Are you sure you want to rewrite all commits with author = $NAME <$EMAIL>? [Y/n] "
    response=${response:l} #tolower
    
    if [[ $response =~ ^(yes|y| ) ]] || [[ -z $response ]]; then
        git filter-branch -f --env-filter "GIT_AUTHOR_NAME='$NAME'; GIT_AUTHOR_EMAIL='$EMAIL'; GIT_COMMITTER_NAME='$NAME'; GIT_COMMITTER_EMAIL='$EMAIL';" HEAD
    fi
}
