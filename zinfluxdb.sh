#!/bin/bash

kubectl delete svc influxdb-service
kubectl delete deployments influxdb-deployment
docker rmi influxdb_img

docker build -t influxdb_img srcs/influxdb/.
kubectl apply -f srcs/influxdb/influxdb.yaml