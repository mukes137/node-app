#!/bin/bash

set -e
LOG_FILE="script_log.txt"

# Specify the non-root user to use
NON_ROOT_USER="mukesh"

{
    echo "Script started at $(date)"

    # Run your commands here
    sudo -u "$NON_ROOT_USER" bash << EOF
        sudo docker build -t node-app:v1 .
        sleep 5
        sed -i '/services:/,/image:/ { /app:/,/image:/ s/\(image: \)[^ ]*/\1$(image_name):$(tag)/ }' docker-compose.yml
        docker-compose up -d
EOF

    echo "Script finished at $(date)"
}>> "$LOG_FILE" 2>&1