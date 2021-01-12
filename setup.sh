#!/bin/bash

minikube delete

minikube --vm-driver=virtualbox start --cpus 4 --memory 4000
eval $(minikube docker-env)
minikube addons enable metallb

docker build -t nginx_img .
docker build -t influxdb_img srcs/influxdb/.
docker build -t grafana_img srcs/grafana/.
docker build -t mysql_img srcs/mysql/
docker build -t phpmyadmin_img srcs/phpmyadmin/
docker build -t wordpress_img srcs/wordpress/

kubectl apply -f srcs/loadbalancer.yaml
kubectl apply -f srcs/nginx/nginx.yaml
kubectl apply -f srcs/influxdb/influxdb.yaml
kubectl apply -f srcs/grafana/grafana.yaml
kubectl apply -f srcs/mysql/mysql.yaml
kubectl apply -f srcs/phpmyadmin/phpmyadmin.yaml
kubectl apply -f srcs/wordpress/wordpress.yaml

minikube dashboard &
