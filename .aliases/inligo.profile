alias cdinligo="cd ~/code/inligo/projects/"
alias inligo_orgnr="echo 915189520; echo 915189520 | pbcopy"

function openwp () {
	
	while IFS= read -r site
	do
		if [ ${#site} -le 3 ]; then continue ; fi

  		echo "open $site"
		open $site

	done < ~/inligo/wp-sites.txt
}
