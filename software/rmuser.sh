#!/bin/bash

# Get the username from the user
read -p "Enter the username of the user you want to remove: " username

# Remove the user with the specified username
sudo userdel -r $username

# Display a message indicating that the user has been removed
echo "User $username has been removed."
