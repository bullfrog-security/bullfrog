#!/bin/bash

CONTAINER_NAME=nginx-d1c8ad79

test() {
    local retries=10
    local nginx_container_ip
    nginx_container_ip=$(docker inspect --format='{{range .NetworkSettings.Networks}}{{.IPAddress}}{{end}}' $CONTAINER_NAME)

    echo "Nginx container IP: $nginx_container_ip"

    for ((attempt = 1; attempt <= retries; attempt++)); do
        echo "Attempt $attempt..."
        if curl --max-time 1 "http://$nginx_container_ip" >/dev/null; then
            echo "Successfully connected to nginx container."
            exit 0
        else
            echo "Connection attempt $attempt failed."
            sleep 1
        fi
    done

    echo "Failed to connect to nginx container."
    exit 1
}

# Start nginx container in detached mode and name it 'nginx'
docker run --detach --name $CONTAINER_NAME nginx:1.27

test
