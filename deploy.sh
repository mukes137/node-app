#!/bin/bash

set -e
LOG_FILE="script_log.txt"
image_name="mukesh1111/novelty"
tag="$1"

# Specify the non-root user to use
NON_ROOT_USER="mukesh"

{
    echo "Script started at $(date)"

    # Run your commands here
    sudo -u "$NON_ROOT_USER" bash << EOF
        echo "Running commands as $NON_ROOT_USER"
        echo "Image name: $image_name"
        echo "Tag: $tag"

        # Pull the latest Docker image
        sudo docker pull "$image_name:$tag"
        sleep 5

        # Update docker-compose.yml with the new image tag
        sed -i '/services:/,/image:/ { /app:/,/image:/ s|\(image: \)[^ ]*|\1$image_name:$tag| }' docker-compose.yml
        sleep 3

        # Restart Docker containers
        docker-compose up -d
EOF

    echo "Script finished at $(date)"
} >> "$LOG_FILE" 2>&1
