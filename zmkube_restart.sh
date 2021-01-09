#!/bin/bash

minikube delete
minikube start
eval $(minikube docker-env)
#docker build -t nginx_img .
minikube addons enable metallb
kubectl apply -f srcs/loadbalancer.yaml
#kubectl apply -f srcs/nginx/nginx.yaml
