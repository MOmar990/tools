#!/bin/bash

iglet -f slant -c MAJECTY | lolcat
echo -e "Welcome to my ultimate tool........\n........which lets you manage your daily tasks more productive, easy, fast!"
read -p "Do you want to read my manual? (yes/no) >>>> " man

if [ $man == "yes" ]; then
  echo "Opening manual"
  sleep 1
elif [ $man == "no" ]; then
  echo "Which service do you want to deal with?"
  sleep 0.5
  echo -e "\n(0) Keyboard lights\n\n(1) Full updating\n\n(2) Enable a service or multiple services\n"
  read -p " >>> " SERVICE_MAIN

  if [ $SERVICE_MAIN -eq 0 ]; then
    echo "|------------- Opening Keyboard lights -------------|"
    xset led on
    echo " "
    echo " "
    echo "|------------- Lights on! -------------|"
    sleep 1
    echo " "
    echo " "
  elif [ $SERVICE_MAIN -eq 1 ]; then
    echo "|------------- Refreshing repositories -------------|"
    sleep 0.5
    echo " "
    echo " "
    echo "|------------- UPDATING! -------------|"
    sleep 1
    sudo apt update
    echo " "
    echo " "
    echo "|------------- UPGRADING! -------------|"
    sleep 1
    sudo apt upgrade -y
    echo "|------------- You are up-to-date! -------------|"
    sleep 1
  elif [ $SERVICE_MAIN -eq 2 ]; then
    echo -e "Which service do you want to manage?\n(1) SNAP\n(2) APACHE\n(3) SSH\n(4) TOR"
    read -p " >>>> " SERVICES_TYPE
    if [ $SERVICES_TYPE -eq 1 ]; then
      echo " "
      echo "|------------- Activating snap softwares -------------|"
      sleep 1
      sudo service snapd.apparmor start && systemctl enable snapd.socket && systemctl start snapd.socket
      echo " "
      echo " "
      echo "|------------- Activation done! -------------|"
      read -p "Do you want to open a snap app? (y/n) >>>> " SERVICES_SNAP
      if [ $SERVICES_SNAP == "y" ]; then
        echo -e "Which one do you want to open?\n(1) Microsoft Teams\n(2) Snap Store\n(3) Telegram\n(4) Discord"
        read -p " >>>> " SERVICES_SNAP_APP_SELECT
        if [ $SERVICES_SNAP_APP_SELECT -eq 1 ]; then
          echo "---- Opening Teams ----"
          teams-for-linux &
          echo "Done!"
        elif [ $SERVICES_SNAP_APP_SELECT -eq 2 ]; then
          echo "---- Opening Snap Store ----"
          snap-store &
          echo "Done!"
        elif [ $SERVICES_SNAP_APP_SELECT -eq 3 ]; then
          echo "---- Opening Telegram ----"
          telegram-desktop &
          echo "Done!"
        elif [ $SERVICES_SNAP_APP_SELECT -eq 4 ]; then
          echo "---- Opening Discord ----"
          discord &
          echo "Done!"
        fi
      elif [ $SERVICES_SNAP == "n" ]; then
        echo "Okay!"
      fi
    elif [ $SERVICES_TYPE -eq 2 ]; then
      echo " "
      echo "|------------- Starting Apache web server -------------|"
      sleep 1
      sudo systemctl start apache2.service
      echo " "
      echo " "
      echo "|------------- Apache web server started! -------------|"
    elif [ $SERVICES_TYPE -eq 3 ]; then
      echo -e "1 [Enable]\n2 [Disable] "
      read -p " >>> " SERVICES_TOR_MANAGE
      if [ $SERVICES_TOR_MANAGE -eq 1  ] ; then
      echo " "
      echo "|------------- Starting SSH service -------------|"
      sleep 1
      sudo systemctl start ssh.service
      echo " "
      echo " "
      echo "|------------- SSH service started! -------------|"
      elif [ $SERVICES_TOR_MANAGE -eq 2 ] ; then
      echo " "
      echo "|------------- Stopping SSH service -------------| "
      sudo systemctl stop ssh
      echo " "
      echo "|------------- SSH service stoped! -------------|"
      fi


    elif [ $SERVICES_TYPE -eq 4 ]; then
      echo " "
      echo "|------------- Starting TOR service -------------|"
      sleep 1
      sudo systemctl start tor.service
      echo " "
      echo " "
      echo "|------------- TOR service started! -------------|"
    fi
  fi
fi

echo " "
echo " "
echo "|---------- Have a nice day! --------|"
sleep 1