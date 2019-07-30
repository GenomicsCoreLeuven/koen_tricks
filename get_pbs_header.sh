#!/bin/bash
#This script was created by Koen Herten

SCRIPT=$(readlink -f $0);
SCRIPTPATH=`dirname $SCRIPT`

#echo $SCRIPTPATH

PRINT_HELP=0
if [ "$#" -gt 2 ]; then
        PRINT_HELP=1
fi

if [ "$1" == "-h" ]; then
        PRINT_HELP=1
fi

if [ "$PRINT_HELP" == "1" ]; then
	if [ "$2" == "md" ]; then
		echo "## get_pbs_header"
		echo ""
		echo "This script generates a pbs header for a new script"
		echo ""
		echo "Usage:"
		echo "\`\`\`bash"
		echo "get_pbs_header"
		echo "\`\`\`"
		echo ""
		echo "Parameters:"
		echo ""
		echo " - MAIL=		The mail adress to use (This can be set as a environment variable in .bash_profile))"
		echo ""
		echo " - PROJECT=	The project to use (This can be set as a environment variable in .bash_profile)"
		echo ""
		echo " - NAME=		The name of the script"
		echo ""
		exit
	fi
        echo "This script generates a pbs header for a new script"
        echo "Usage: "
        echo "	get_pbs_header"
	echo "Parameters:"
	echo " - MAIL=		The mail adress to use (This can be set as a environment variable in .bash_profile))"
	echo " - PROJECT=       The project to use (This can be set as a environment variable in .bash_profile)"
	echo " - NAME=          The name of the script"
        exit
fi



for var in "$@";
do
	var_name=`echo $var | awk -v FS='=' '{print $1}'`
	var_value=`echo $var | awk -v FS='=' '{print $2}'`
	case $var_name in
		MAIL)
			MAIL=$var_value
			;;
		PROJECT)
			PROJECT=$var_value
			;;
		NAME)
			NAME=$var_value
			;;
		*)
			>&2 echo "Given parameter $var_name is not a valid parameter"
			;;
	esac
done

if [ -z "$MAIL" ]; then
	#no mail
	>&2 echo "No mail found"
fi

if [ -z "$NAME" ]; then
	#no name
	>&2 echo "No name found"
	NAME="my_task"
fi

if [ -z "$PROJECT" ]; then 
	#no project
	>&2 echo "No project found"
	exit
fi

echo "#!/bin/bash -l
#PBS -l walltime=24:00:00
#PBS -l nodes=1:ppn=36
#PBS -l mem=180gb"

if [ ! -z "$MAIL" ]; then
	#mail found
	echo "#PBS -M $MAIL"
	echo "#PBS -m aeb"
fi
echo "#PBS -N $NAME"
echo "#PBS -A $PROJECT"
echo ""
echo ""
echo "#Load here the needed modules"
echo ""
echo ""
PROJECT_DIR=`pwd -P`
echo "PROJECT_DIR="$PROJECT_DIR
echo ""
echo ""
