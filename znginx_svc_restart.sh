#!/bin/bash

kubectl delete svc nginx-svc
kubectl delete deployments nginx-deployment
sleep 10
docker rmi nginx_img
docker build -t nginx_img .
kubectl apply -f srcs/nginx/nginx.yaml
echo "Wait for 3 second"
sleep 3
kubectl get pods
