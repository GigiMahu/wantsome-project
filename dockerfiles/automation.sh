#!/bin/bash
stage=$1
case $stage in
    build)
        docker build \
            -f dockerfile.lb \
            -t load_balancer:0.0.1 \
            .
        docker build \
            -f dockerfile.app \
            -t application:0.0.1 \
            .
        docker build \
            -f dockerfile.db \
            -t database:0.0.1 \
            .
        ;;
    run)
        docker network create wantsome
        docker run \
            --detach \
            --name db \
            --network wantsome \
            database:0.0.1
        docker run \
            --detach \
            --name app1 \
            --network wantsome \
            application:0.0.1
        docker run \
            --detach \
            --name app2 \
            --network wantsome \
            application:0.0.1
        docker run \
            --rm \
            --detach \
            --publish 80:80 \
            --network wantsome \
            --name load_balancer \
            load_balancer:0.0.1
        ;;
    *)
        echo "You are sending the wrong argument!"
esac