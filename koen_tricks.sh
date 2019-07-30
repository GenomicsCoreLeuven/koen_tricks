#!/bin/bash -l
#This script was created by Koen Herten

SCRIPT=$(readlink -f $0);
SCRIPTPATH=`dirname $SCRIPT`

#echo $SCRIPTPATH

PRINT_HELP=0
MUTE=0
if [ "$#" -ne 0 ]; then
        PRINT_HELP=1
fi

if [ "$1" == "-h" ]; then
        PRINT_HELP=1
fi

if [ "$1" == "-mute" ]; then
	PRINT_HELP=0
	MUTE=1
fi

if [ "$PRINT_HELP" == "1" ]; then
	if [ "$2" == "md" ]; then
		echo "## koen_tricks"
		echo ""
		echo "This script generates a help page for all other tools in this package"
		echo ""
		echo "Usage:"
		echo "\`\`\`bash"
		echo "koen_tricks"
		echo "\`\`\`"
		echo ""
		echo "Parameters:"
		echo ""
		echo " - \-mute		Only generate the README.md file"
		echo ""
		exit
	fi
        echo "This script generates a help page for all other tools in this package"
        echo "Usage: "
        echo "	koen_tricks"
	echo "Parameters:"
	echo "	-mute 		Only generate the README.md file"
        exit
fi



#####################################
#				    #
# Generate help for the other tools #
#				    #
#####################################

echo "# Koen's Tricks and Scripts" > README.md

echo "" >> README.md
echo "Tool list:" >> README.md
echo "" >> README.md
for tool in `ls -1 *sh`;
do
	echo " - $tool" >> README.md
	echo "" >> README.md
done
echo "" >> README.md

for tool in `ls -1 *sh`;
do
	echo "" >> README.md
	./$tool -h md >> README.md
	echo "" >> README.md
done

if [ "$MUTE" == "0" ]; then
	./viewer_md.sh README.md
fi

