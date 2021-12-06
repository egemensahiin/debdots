#!/bin/bash

TMP_HTML="/tmp/get_article_html"

usage(){
  	echo "Usage: ${0} [-hv] [-o OUTPUT] DOI"
  	echo "Get an article from sci-hub with its DOI."
  	echo "  -o OUTPUT	Output file name"
  	echo "  -h			Prints usage."
  	echo "  -v			Verbose output."
}

get_pdf(){
	wget -O ${TMP_HTML} "https://sci-hub.se/${DOI}"
	PDF_URL="$(cat ${TMP_HTML} | grep -A1 '<div id="article">' | tail -n 1 | awk -F 'src="' '{print $NF}' | awk -F '#' '{print $1}')"
	if [[ $PDF_URL == "" ]]
	then
		echo "Couln't find the article. Please check DOI and try again." >&2
		exit 1
	fi
	if [[ ${OUTPUT} != "" ]]
	then
		wget -O ${OUTPUT} "${PDF_URL}"
	else
		wget "${PDF_URL}"
	fi
}

error_exit(){
	echo "$1" >&2
	usage >&2
    exit 1
}

while getopts ho:v OPTION
do
	case ${OPTION} in
		v)
			VERBOSE="true"
			;;
		h)
			usage
			exit 0
			;;
		o)
			OUTPUT="${OPTARG}"
			;;
		?)
			error_exit "Invalid argument or option." >&2
			;;
	esac
done

shift "$(( OPTIND - 1 ))"

[[ "${#}" -gt 1 ]] && error_exit "Too many arguments."
[[ "${#}" -lt 1 ]] && error_exit "No DOI given."

DOI="$1"

if [[ $VERBOSE == "true" ]]
then
	get_pdf
else
	get_pdf &>/dev/null
fi

exit 0
