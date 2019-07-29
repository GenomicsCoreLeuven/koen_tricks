#!/bin/bash

SCRIPT=$(readlink -f $0);
SCRIPTPATH=`dirname $SCRIPT`

#echo $SCRIPTPATH

PRINT_HELP=0
if [ "$#" -ne 0 ]; then
        PRINT_HELP=1
fi

if [ "$1" == "-h" ]; then
        PRINT_HELP=1
fi

if [ "$PRINT_HELP" == "1" ]; then
        if [ "$2" == "md" ]; then
                echo "## *ls_names*"
                echo ""
                echo "This script is a ls, but changes the user numbers into names"
                echo ""
		echo "Usage:"
                echo "\`\`\`bash"
                echo "ls_gc"
                echo "\`\`\`"
                exit
        fi
        echo "This script is a ls, but changes the user numbers into names"
        echo "Usage: "
        echo "	ls_names"
        exit
fi


ls -lha --color=always | awk -v SCRIPTPATH=$SCRIPTPATH 'BEGIN{user_file=SCRIPTPATH"/src/user_list"; while(( getline line<user_file) > 0){split(line,arr,"\t"); names[arr[1]]=arr[2];}}{if(names[$3]!=""){$3=names[$3]; } print $0}' | column -t
