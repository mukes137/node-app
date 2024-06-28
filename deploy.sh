#!/bin/bash

set -e
LOG_FILE="script_log.txt"
image_name="mukesh1111/novelty"
tag="$1"


{
    echo "Script started at $(date)"

    # Run your commands here
    bash << EOF
        cd app
        echo "Running commands as $NON_ROOT_USER"
        echo "Image name: $image_name"
        echo "Tag: $tag"

        # Pull the latest Docker image
        docker pull "$image_name:$tag"
        sleep 5

        # Update docker-compose.yml with the new image tag
        sed -i '/services:/,/image:/ { /app:/,/image:/ s|\(image: \)[^ ]*|\1$image_name:$tag| }' docker-compose.yml
        sleep 3

        # Restart Docker containers
        docker-compose up -d
EOF

    echo "Script finished at $(date)"
} >> "$LOG_FILE" 2>&1
