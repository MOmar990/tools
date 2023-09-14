#!/bin/bash

# Enter the directory where temporary files are stored
cd /var/tmp

# Remove all files that have not been accessed in the last 7 days
find . -atime +7 -type f -delete

# Remove all empty directories
find . -type d -empty -delete

# Display a message when the script has finished running
echo "Temporary files have been cleaned up."
