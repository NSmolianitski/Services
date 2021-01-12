#!/bin/bash

kubectl delete svc mysql-service
kubectl delete deployments mysql
kubectl delete -n default persistentvolumeclaim mysql-pv-claim
kubectl delete persistentvolume mysql-pv-volume
docker rmi mysql_img

docker build -t mysql_img srcs/mysql/
kubectl apply -f srcs/mysql/mysql.yaml
sleep 3
kubectl exec $(kubectl get pods | grep mysql | awk '{print $1}') -- /bin/sh -c /scripts/restore_database.sh
