#! /bin/bash

if [ -z $1 -o -z $2 ] ;
then
    echo "usage hashing_files_compare <file1> <file2>"
    exit 0
fi

file1=`md5sum $1`
file2=`md5sum $2`

# echo "file 1 is $file1"
# e	cho "file 2 is $file2"

IFS=' '
read -ra ADDR1 <<<$file1
read -ra ADDR2 <<<$file2
echo " ${ADDR1[0]}"
echo " ${ADDR2[0]}"

if [ $ADDR1[0] = $ADDR2[0] ] ;
then
    echo "these files are similar"
else
    echo "these files are different"
fi
