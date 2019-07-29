#!/bin/bash

PRINT_HELP=0
if [ "$#" -ne 0 ]; then
        PRINT_HELP=1
fi

if [ "$1" == "-h" ]; then
        PRINT_HELP=1
fi

if [ "$PRINT_HELP" == "1" ]; then
        if [ "$2" == "md" ]; then
                echo "## *disk_jv*"
                echo ""
                echo "This script returns the disk usage of Joris' disk (stg 19)"
                echo ""
		echo "Usage:"
		echo "\`\`\`bash"
                echo "disk_jv"
                echo "\`\`\`"
                exit
        fi
        echo "This script returns the disk usage of Joris' disk (stg19)"
        echo "Usage: "
        echo "	disk_jv"
        exit
fi


mmlsquota  -j stg_00019 --block-size auto vol_ddn2
