#! /bin/
bash

function list_processes() {
    echo "Listing all running processes:"
    ps aux
}

function kill_process() {
    if [ -z "$1" ]; then
        echo "Error: no process ID specified"
        return 1
    fi

    echo "Killing process with ID $1..."
    kill "$1"
}

function search_processes() {
    if [ -z "$1" ]; then
        echo "Error: no search term specified"
        return 1
    fi

    echo "Searching for processes with name or command line containing '$1':"
    ps aux | grep "$1"
}

function show_process_tree() {
    if [ -z "$1" ]; then
        echo "Error: no process ID specified"
        return 1
    fi

    echo "Showing process tree for ID $1:"
    pstree "$1"
}

function show_process_details() {
    if [ -z "$1" ]; then
        echo "Error: no process ID specified"
        return 1
    fi

    echo "Showing details for process with ID $1:"
    ps -p "$1" -o user,pid,ppid,%cpu,%mem,stat,start,time,command
}

while true; do
    echo "What would you like to do?"
    echo "1. List running processes"
    echo "2. Kill a process"
    echo "3. Search for a process by name or command line"
    echo "4. Show process tree for a process ID"
    echo "5. Show details for a process ID"
    echo "6. Quit"

    read -p "Enter choice (1-6): " choice

    case $choice in
        1)
            list_processes
            ;;
        2)
            read -p "Enter process ID to kill: " pid
            kill_process "$pid"
            ;;
        3)
            read -p "Enter search term: " term
            search_processes "$term"
            ;;
        4)
            read -p "Enter process ID to show tree: " pid
            show_process_tree "$pid"
            ;;
        5)
            read -p "Enter process ID to show details: " pid
            show_process_details "$pid"
            ;;
        6)
            echo "Goodbye!"
            exit 0
            ;;
        *)
            echo "Invalid choice"
            ;;
    esac

    echo ""
done
