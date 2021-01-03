#!/bin/bash

docker rmi nginx_img
docker build -t nginx_img .
kubectl apply -f srcs/nginx/nginx.yaml