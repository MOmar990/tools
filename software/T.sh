#! /bin/bash

echo "----------------------- Fuck socity! ---------------------- "
sleep 2
echo "Do you want to make a (new) file or add an execute permission for an (exist) script? "
read -p "----> " CHOICE
if [ $CHOICE = "new" ] ;
then
    echo "Enter the name of the script file: "
    read -p "---> " NAME_1
    echo "Do you want to save the script in the (current) path or (another) one ?"
    read -p "----> " CHOICE_2
    if [ $CHOICE_2 = "current" ];
    then 
        echo "Starting NANO now!"
        sleep 1
        nano ./$NAME_1
        echo "....... Giving Privalavges ......... "
        sleep 2
        chmod +x $NAME_1
        echo "File created on the name: --> $NAME_1 <-- and Execution request approved!"
    else 
        read -p "Write the wanted path: " PATH
        echo "Starting NANO now!"
        sleep 1
        echo "Your Path will be: $PATH"
        nano $NAME_1
        echo "....... Giving Privalavges ......... "
        sleep 2
        chmod +x $NAME_1
        echo "File created on the name:--> $NAME_1 <-- and Execution request approved!"
    fi
elif [ $CHOICE = "exist" ] ;
then
    echo "Enter the name of the exist script file: "
    read -p "---> " NAME_2
    echo "....... Giving Privalavges ......... "
    sleep 2
    chmod +x $NAME_2
    echo "File on the name: --> $NAME_2 <-- Execution request approved!"
fi
