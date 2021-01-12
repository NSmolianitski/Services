#!/bin/bash

kubectl delete svc ftps-service
kubectl delete deployments ftps
docker rmi ftps_img

docker build -t ftps_img srcs/ftps/.
kubectl apply -f srcs/ftps/ftps.yaml