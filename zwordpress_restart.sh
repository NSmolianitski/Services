#!/bin/bash

kubectl delete svc wordpress-service
kubectl delete deployments wordpress-deployment
docker rmi wordpress_img

docker build -t wordpress_img srcs/wordpress/
kubectl apply -f srcs/wordpress/wordpress.yaml
