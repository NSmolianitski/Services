#!/bin/bash

kubectl delete svc mysql-svc
kubectl delete deployments mysql-deployment
docker rmi mysql_img
docker build -t mysql_img srcs/mysql/
kubectl apply -f srcs/mysql/mysql.yaml
