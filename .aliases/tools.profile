alias todo="todo.sh"
alias dlwebpage="wget -m -p -E -k -K -np"

function jwtdecode() {
	jq -R 'split(".") | .[1] | @base64d | fromjson' <<< "$1"
}
