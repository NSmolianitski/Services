#!/bin/bash

kubectl delete svc nginx-service
kubectl delete deployments nginx
docker rmi nginx_img

docker build --no-cache -t nginx_img .
kubectl apply -f srcs/nginx/nginx.yaml
kubectl get pods
