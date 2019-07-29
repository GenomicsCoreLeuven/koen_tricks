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
		echo "## *disk_gc*"
		echo ""
		echo "This script returns the disk usage of the GC disk (stg 45)"
		echo ""
		echo "Usage:"
		echo "\`\`\`bash"
		echo "disk_gc"
		echo "\`\`\`"
		exit
	fi
        echo "This script returns the disk usage of the GC disk (stg45)"
        echo "Usage: "
        echo "	disk_gc"
        exit
fi


mmlsquota  -j stg_00045 --block-size auto vol_ddn2
