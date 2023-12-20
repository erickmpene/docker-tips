#!/bin/bash

# Retrieve the list of inactive containers
inactive_containers=$(docker ps -q --filter "status=exited")

# Check if inactive containers were found
if [ -z "$inactive_containers" ]; then
    echo "No inactive containers found."
else
    # Display the list of inactive containers
    echo "Inactive containers found:"
    echo "$inactive_containers"

    # Ask for confirmation to remove the containers
    read -p "Do you want to remove these inactive containers? (y/n): " choice

    if [ "$choice" = "y" ] || [ "$choice" = "Y" ]; then
        # Remove inactive containers
        docker rm $inactive_containers
        echo "Inactive containers have been removed."
    else
        echo "Operation canceled. No containers were removed."
    fi
fi

