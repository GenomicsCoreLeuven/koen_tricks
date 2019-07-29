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

if [ "$PRINT_HELP" == "1" ]; then
	if [ "$2" == "md" ]; then
                echo "## *viewer_csv*"
                echo ""
                echo "A clear view of csv files"
                echo ""
		echo "Usage:"
                echo "\`\`\`bash"
                echo "viewer_csv file.csv"
                echo "\`\`\`"
		echo "Parameters:"
		echo ""
		echo " - file.csv	the CSV file to view"
                exit
        fi
	echo "A clear view of csv files"
	echo "Usage: "
	echo "	viewer_csv file.csv"
	echo "		file.csv	the CSV file to view"
	exit
fi
 

column -s, -t < $1 | less -#2 -N -S -R

