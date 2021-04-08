portproc(){
        lsof -i:$1
}

timeit() {
  local start=$(date +%s)
  $@ > /dev/null 2>&1
  local exit_code=$?
  echo >&2 "took ~$(($(date +%s)-${start})) seconds. exited with ${exit_code}"
  return $exit_code
}
