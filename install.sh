#! /bin/bash

# Start Minikube
minikube start

sleep 60

# To point your shell to minikube's docker-daemon, run:
eval $(minikube -p minikube docker-env)

# Build Docker Image
docker build -t hello-app .

# Install Helm release to run a pod with hello-app image
# Expose the http endpoint using a loadbalancer service
helm install hello ./chart

# Run a minikube tunnel in the background
kubectl port-forward --address 0.0.0.0 services/hello 8081:80 


