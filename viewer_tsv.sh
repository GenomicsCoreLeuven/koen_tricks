#!/bin/bash
#This script was created by Koen Herten

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
                echo "## *viewer_tsv*"
                echo ""
                echo "A clear view of tsv files"
                echo ""
		echo "Usage:"
                echo "\`\`\`bash"
                echo "viewer_tsv file.tsv"
                echo "\`\`\`"
                echo "Parameters:"
                echo ""
		echo " - file.tsv       the TSV file to view"
                exit
        fi
	echo "A clear view of tsv files"
	echo "Usage: "
	echo "	viewer_tsv file.tsv"
	echo "		file.tsv	the TSV file to view"
	exit
fi
 

column -ts $'\t' < $1 | less -#2 -N -S -R


