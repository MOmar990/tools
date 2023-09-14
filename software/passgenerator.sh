#! /bin/bash

# simple password generator

echo "This is a simple password generator"

echo "Do you want it in |base64| or |  hex |?"
echo "                  |strong|    |weaker|"
read -p "----> " ANSWER1
if [ $ANSWER1 = "base64" ];
then
    echo "Please enter the length of the password: "
    read PASS_LENGTH
    echo "------------ Generating base64 passwords! ------------"
    sleep 1
    for P in $(seq 1 5); do
        openssl rand -base64 48 | cut -c1-$PASS_LENGTH
    done
elif [ $ANSWER1 = "hex" ];
then
    echo "Please enter the length of the password: "
    read PASS_LENGTH
    echo "------------ Generating hex paswords! ------------"
    sleep 1
    for P in $(seq 1 5); do
    openssl rand -hex 48 | cut -c1-$PASS_LENGTH
    done
fi

