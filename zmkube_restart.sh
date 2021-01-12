#!/bin/bash

minikube delete
minikube --vm-driver=virtualbox start --cpus 4 --memory 4000
eval $(minikube docker-env)
#docker build -t nginx_img .
minikube addons enable metallb
kubectl apply -f srcs/loadbalancer.yaml
#kubectl apply -f srcs/nginx/nginx.yaml
