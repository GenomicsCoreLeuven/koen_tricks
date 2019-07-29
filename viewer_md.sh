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
                echo "## *viewer_md*"
                echo ""
                echo "A clear view of md files (mark-down)"
                echo ""
		echo "Usage:"
                echo "\`\`\`bash"
                echo "viewer_md file.md"
                echo "\`\`\`"
                echo "Parameters:"
                echo ""
		echo " - file.md       the MD file to view"
                exit
        fi
	echo "A clear view of md files (mark-down)"
	echo "Usage: "
	echo "	viewer_md file.md"
	echo "		file.md		the MD file to view"
	exit
fi
 

source activate koen_tricks_1.0

pandoc $1 | lynx -stdin

conda deactivate

