alias wpscan="docker run -it --rm wpscanteam/wpscan --api-token t7ioV83EDFwBy0Bq1P1m3J7szsL8Vba6JxasuQBRbQM --stealthy"

ctftools() {
        if [ "$1" = "build" ]; then
                cd ~/code/ctf/tools/ctf_docker/
                ./build.sh
        else
                ~/code/ctf/tools/ctf_docker/start.sh
        fi
}
