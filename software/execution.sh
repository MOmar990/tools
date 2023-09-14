#! /bin/bash

# This script allows the user to manage the execution privileges of files on Linux.

# Define function to check if a file exists.
file_exists() {
    if [ -f "$1" ]; then
        return 0
    else
        return 1
    fi
}

# Define function to check if a file has execution privileges.
has_execute_permission() {
    if [ -x "$1" ]; then
        return 0
    else
        return 1
    fi
}

# Define function to give execution privileges to a file.
give_execute_permission() {
    if file_exists "$1"; then
        chmod +x "$1"
        echo "Execution privileges granted to file: $1"
    else
        echo "File does not exist: $1"
    fi
}

# Define function to remove execution privileges from a file.
remove_execute_permission() {
    if file_exists "$1" && has_execute_permission "$1"; then
        chmod -x "$1"
        echo "Execution privileges removed from file: $1"
    elif file_exists "$1"; then
        echo "File does not have execution privileges: $1"
    else
        echo "File does not exist: $1"
    fi
}

# Define function to display usage instructions.
usage() {
    echo "Usage: $0 [-g|-r] file"
    echo "  -g  give execution privileges to file"
    echo "  -r  remove execution privileges from file"
    exit 1
}

# Parse command line arguments.
if [ $# -ne 2 ]; then
    usage
fi

if [ "$1" != "-g" ] && [ "$1" != "-r" ]; then
    usage
fi

if [ ! -f "$2" ]; then
    echo "File not found: $2"
    exit 1
fi

# Call appropriate function based on command line arguments.
if [ "$1" = "-g" ]; then
    give_execute_permission "$2"
elif [ "$1" = "-r" ]; then
    remove_execute_permission "$2"
fi

