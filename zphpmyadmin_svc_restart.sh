#!/bin/bash

kubectl delete svc phpmyadmin-svc
kubectl delete deployments phpmyadmin-deployment
docker rmi phpmyadmin_img
docker build -t phpmyadmin_img srcs/phpmyadmin/
kubectl apply -f srcs/phpmyadmin/phpmyadmin.yaml
