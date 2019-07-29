#!/bin/bash

SCRIPT=$(readlink -f $0);
SCRIPTPATH=`dirname $SCRIPT`

#echo $SCRIPTPATH

PRINT_HELP=0
if [ "$#" -ne 1 ]; then
	PRINT_HELP=1
fi

if [ "$1" == "-h" ]; then
	PRINT_HELP=1
fi

if [ "$1" == "--h" ]; then
	grep -h
fi

if [ "$PRINT_HELP" == "1" ]; then
        if [ "$2" == "md" ]; then
                echo "## *cgrep*"
                echo ""
                echo "A modified version of grep"
                echo ""
		echo "Usage:"
                echo "\`\`\`bash"
                echo "cgrep pattern file"
                echo "\`\`\`"
                echo "Parameters:"
                echo ""
		echo " - pattern	the pattern or string to search"
		echo ""
		echo " - file       	the file to search in"
		echo ""
		echo " - \-\-h		*cgrep \-\-h* : the help of grep"
		echo ""
                exit
        fi
	echo "A modified version of grep"
	echo "Usage: "
	echo "	cgrep pattern file"
	echo "		pattern		the pattern or string to search"
	echo "		file		the file to search in"
	echo "		--h		*cgrep --h* : the help of grep"
	exit
fi
 
grep --color=always -i "${@}"
