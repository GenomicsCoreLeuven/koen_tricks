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
	less -h
fi

if [ "$PRINT_HELP" == "1" ]; then
        if [ "$2" == "md" ]; then
                echo "## *cless*"
                echo ""
                echo "A modified version of less, to use with cgrep"
                echo ""
		echo "Usage:"
                echo "\`\`\`bash"
                echo "cless file"
		echo "cgrep pattern file | cless"
                echo "\`\`\`"
                echo "Parameters:"
                echo ""
		echo " - file       	the file to display"
		echo ""
		echo " - \-\-h		*cless \-\-h* : the help of less"
		echo ""
                exit
        fi
	echo "A modified version of less"
	echo "Usage: "
	echo "	cless file"
	echo "		file		the file to display"
	echo "		--h		*cless --h* : the help of less"
	exit
fi
 
less -R "${@}"
