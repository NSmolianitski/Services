#!/bin/bash

kubectl delete svc grafana-service
kubectl delete deployments grafana-deployment
docker rmi grafana_img

docker build -t grafana_img srcs/grafana/.
kubectl apply -f srcs/grafana/grafana.yaml