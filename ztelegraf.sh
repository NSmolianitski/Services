#!/bin/bash

kubectl delete svc telegraf-service
kubectl delete deployments telegraf-deployment
docker rmi telegraf_img

docker build -t telegraf_img srcs/telegraf/.
kubectl apply -f srcs/telegraf/telegraf.yaml