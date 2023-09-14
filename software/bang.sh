#! /bin/bash


echo "Welcome to universal tool "
read -p "which service you wnat: " SERV # variable of service
if [ SERV = "searching" ];
then
     echo "Do you wanna search for a file or a folder?: "                                                                                                                                                   
     read ANS
     if [ $ANS = "folder" ];
     then
          echo "Enter the place you want to search into & folder name you want to search: "
          read PATH FOLD
          if [ -d ~/$FOLD ];
          then
               echo "Yes is exist"
          else
               echo "this file is not exist"
          fi 
     fi
elif [ $ANS = "file" ];
then
     echo "Enter the path you want to search into & folder name & file name you want to search: "
     read PATH FOLD FILE
     if [ -e {$PATH}/{$FOLD}/{$FILE} ];
     then
          echo "Yes is exist"
     else
          echo "this file is not exist" 
     fi
fi

