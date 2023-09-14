#! /bin/bash

# positional parameters range from 0 to 9 ... and they are noted by using the dollar sign $
# $0 ----> notice that first postional parameter is given to the main script ----> {./adduser.sh} is equal to $0 parameter

echo "Execution of script:$0"
echo "Enter the name of the user:$1"
#Adding the user
adduser --home /$1 $1





