#!/bin/bash

eval $(minikube docker-env)
docker rmi mysql_img
#docker rmi nginx_img
#docker rmi wordpress_img

#docker build -t nginx_img .
#docker build -t wordpress_img srcs/wordpress/
docker build -t mysql_img srcs/mysql/
kubectl apply -f srcs/mysql/mysql.yaml
#kubectl apply -f srcs/nginx/nginx.yaml
#kubectl apply -f srcs/wordpress/wordpress.yaml
