export QUARKUS_HTTP_PORT=8090
export NODE_EXTRA_CA_CERTS=~/sb1a-root-ca.cer
export AWS_PROFILE_BSF=077677634921_bsfmeglersys-preprod-developer

J17_HOME=/usr/local/opt/openjdk@17
J11_HOME=/usr/local/opt/openjdk@11

alias j17_mvn="JAVA_HOME=$J17_HOME mvn"
alias j11_mvn="JAVA_HOME=$J11_HOME mvn"

alias bsfweb_backend="java -jar ~/code/fremtind/bsf-web/backend/api/target/bsf-web-*.jar --spring.profiles.active=DEV"
alias bsfweb_backend_build="cd ~/code/fremtind/bsf-web/backend/api && mvn clean install -Dmaven.test.skip=true"
alias bsfweb_frontend="cd ~/code/fremtind/bsf-web/frontend && pnpm dev"

alias ivit-token="/Users/marie.frogner/code/fremtind/bsf-ivit-entrypoint/scripts/openid-token.sh fremtind-portveien-bsf-epost-client d1394bc2-d220-4771-bbdd-3ddbf83efad7 | pbcopy"
alias get-shifter-build="/Users/marie.frogner/code/fremtind/scripts/get-shifter-build.sh"

alias k="kubectl"

export JAVA_HOME="$J17_HOME"


# NVM setup
export NVM_DIR="$HOME/.nvm"
[ -s "$(brew --prefix)/opt/nvm/nvm.sh" ] && . "$(brew --prefix)/opt/nvm/nvm.sh" # This loads nvm
[ -s "$(brew --prefix)/opt/nvm/etc/bash_completion.d/nvm" ] && . "$(brew --prefix)/opt/nvm/etc/bash_completion.d/nvm" # This loads nvm bash_completion

function awsenv() {
  #
  # Setup første gang:
  # - Logg inn på Fremtind AWS (se https://github.com/fremtind/bsf-web#deployment-to-aws). Kopier så ~/.aws til ~/.aws.fremtind.
  # - Slett ~/.aws mappen og logg inn på sb1u AWS med `bob aws login`. Kopier så ~/.aws til ~/.aws.sb1u.
  # - Skriv nåværende miljø inn i ~/.aws.current
  # 

  awsenv=$1
  current_aws=$(cat ~/.aws.current)

  if [[ "$awsenv" = "sb1u" ]]; then
    rm -rf ~/.aws
    cp -r ~/.aws.sb1u ~/.aws
    echo "sb1u" > ~/.aws.current
  elif [[ "$awsenv" = "fremtind" ]]; then
    rm -rf ~/.aws
    cp -r ~/.aws.fremtind ~/.aws
    echo "fremtind" > ~/.aws.current
  else
    echo "Current AWS env: $current_aws"
  fi
}

function leveranse() {
    filnavn=$1
    curl_params=$2
    curl $curl_params -H 'X-Requested-With: curl' --negotiate --user : -F uploadfile="@$filnavn" https://leveransemottak.intern.sparebank1.no/api/v1/upload-app\?authmethod\=kerberos
}

podlogs () {
	kubectl logs --follow $1 | grep --color=auto --exclude-dir={.bzr,CVS,.git,.hg,.svn,.idea,.tox} '^{' | jq
}

function podshell() {
	kubectl exec --stdin --tty $1 -- /bin/bash
}

function trollstigen() {
	curl "https://trollstigen.test.fremtind.no/mirror-push-webhook?imageReference=$1"
} 

