#!/bin/bash

echo "Welcome to Docker Image Manager!"

while true; do
  echo "Please select an option:"
  echo "1. List all Docker images"
  echo "2. Download a new Docker image"
  echo "3. Remove a Docker image"
  echo "4. Upload a Docker image to Docker Hub"
  echo "5. Build a new Docker image from a Dockerfile"
  echo "6. Exit"

  read option

  case $option in
    1)
      docker images
      ;;
    2)
      echo "Enter the name of the Docker image to download:"
      read image_name
      docker pull $image_name
      ;;
    3)
      echo "Enter the name of the Docker image to remove:"
      read image_name
      docker rmi $image_name
      ;;
    4)
      echo "Enter the name of the Docker image to upload to Docker Hub:"
      read image_name
      docker push $image_name
      ;;
    5)
      echo "Enter the name of the Dockerfile directory:"
      read dockerfile_directory
      echo "Enter the name of the Docker image to build:"
      read image_name
      docker build -t $image_name $dockerfile_directory
      ;;
    6)
      exit 0
      ;;
    *)
      echo "Invalid option. Please try again."
      ;;
  esac
done
