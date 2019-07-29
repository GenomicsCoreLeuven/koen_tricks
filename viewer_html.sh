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
                echo "## *viewer_html*"
                echo ""
                echo "A clear view of HTML files"
		echo ""
		echo "Note: this viewer can not render images. To see images, please use a GUI browser (like firefox)."
		echo "	The best way to do this, is to download the file, and view it locally."
                echo ""
		echo "Usage:"
                echo "\`\`\`bash"
                echo "viewer_html file.html"
                echo "\`\`\`"
                echo "Parameters:"
                echo ""
		echo " - file.html       the HTML file to view"
                exit
        fi

	echo "A clear view of HTML files."
	echo "		Note: this viewer can not render images"
	echo "			to see images, please use a GUI browser (like firefox)"
	echo "			best way to do this, is to download the file, and view local"
	echo "Usage: "
	echo "	viewer_html file.html"
	echo "		file.html	the HTML file to view"
	exit
fi
 

source activate koen_tricks_1.0

lynx $1

conda deactivate

