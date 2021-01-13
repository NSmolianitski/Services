#!/bin/bash

kubectl delete svc wordpress-service
kubectl delete deployments wordpress
docker rmi wordpress_img

docker build --no-cache -t wordpress_img srcs/wordpress/
kubectl apply -f srcs/wordpress/wordpress.yaml
