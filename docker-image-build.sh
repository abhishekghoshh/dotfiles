#!/bin/bash

# Toggle variables - set to false to skip individual builds
BUILD_IMAGES=true

BUILD_DOCS=false
BUILD_ALPINE=false
BUILD_UBUNTU=true

BUILD_DEV=false

BUILD_GOLANG=false
BUILD_JAVA=false
BUILD_JS=false
BUILD_PYTHON=false
BUILD_RUST=false


if [ "$BUILD_IMAGES" = true ]; then
    echo "Building Docker images..."
    
    if [ "$BUILD_DOCS" = true ]; then
        echo "Building dotfiles-docs image..."
        docker build -t abhishek1009/dotfiles-docs:latest -f Dockerfile.docs .
    fi
    
    if [ "$BUILD_ALPINE" = true ]; then
        echo "Building alpine image..."
        docker build -t abhishek1009/alpine:latest -f Dockerfile.alpine .
    fi
    
    if [ "$BUILD_UBUNTU" = true ]; then
        echo "Building ubuntu image..."
        docker build -t abhishek1009/ubuntu:latest -f Dockerfile.ubuntu .
    fi
    
    # Build remaining images in parallel
    pids=()
    
    if [ "$BUILD_DEV" = true ]; then
        echo "Building dev image..."
        docker build -t abhishek1009/dev:latest -f Dockerfile.dev . &
        pids+=($!)
    fi
    
    if [ "$BUILD_PYTHON" = true ]; then
        echo "Building python image..."
        docker build -t abhishek1009/python:latest -f Dockerfile.python . &
        pids+=($!)
    fi
    
    if [ "$BUILD_JAVA" = true ]; then
        echo "Building java image..."
        docker build -t abhishek1009/java:latest -f Dockerfile.java . &
        pids+=($!)
    fi
    
    if [ "$BUILD_GOLANG" = true ]; then
        echo "Building golang image..."
        docker build -t abhishek1009/golang:latest -f Dockerfile.golang . &
        pids+=($!)
    fi
    
    if [ "$BUILD_JS" = true ]; then
        echo "Building js image..."
        docker build -t abhishek1009/js:latest -f Dockerfile.js . &
        pids+=($!)
    fi
    
    if [ "$BUILD_RUST" = true ]; then
        echo "Building rust image..."
        docker build -t abhishek1009/rust:latest -f Dockerfile.rust . &
        pids+=($!)
    fi
    
    # Wait for all background processes to complete
    for pid in "${pids[@]}"; do
        wait $pid
    done
    
    echo "All enabled Docker images built successfully!"
else
    echo "Skipping Docker image builds (BUILD_IMAGES=false)"
fi