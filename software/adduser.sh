#!/bin/bash

# Get the username from the user
read -p "Enter the username for the new user: " username

# Create the user with the specified username
sudo adduser $username

# Set a password for the new user
sudo passwd $username

# Add the new user to the sudo group
sudo usermod -aG sudo $username

# Display a message indicating that the new user has been created
echo "User $username has been created."

