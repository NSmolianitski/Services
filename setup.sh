#!/bin/bash

minikube delete

while true
do
  if minikube --vm-driver=virtualbox start --cpus 2 --memory 3000 | grep "Done! kubectl is now configured"; then
    break;
  fi
  echo -e "\n\033[34mI am minikube and I don't want to work! Let me sleep 5 minutes more...\033[0m"
done

eval $(minikube docker-env)
docker pull metallb/speaker:v0.8.2
docker pull metallb/controller:v0.8.2
minikube addons enable metallb

docker build -t nginx_img srcs/.
docker build -t influxdb_img srcs/influxdb/.
docker build -t grafana_img srcs/grafana/.
docker build -t phpmyadmin_img srcs/phpmyadmin/.
docker build -t wordpress_img srcs/wordpress/.
docker build -t ftps_img srcs/ftps/.
docker build -t mysql_img srcs/mysql/.

kubectl apply -f srcs/loadbalancer.yaml
kubectl apply -f srcs/mysql/mysql.yaml
while true
do
  if kubectl exec $(kubectl get pods | grep mysql | awk '{print $1}') -- /bin/sh -c /scripts/restore_database.sh | grep "Database created"; then
    break;
  fi
  echo -e "\n\033[34mI am mysql and I don't want to accept your amazing database! Wait until I'll be ready for it...\033[0m"
done
sleep 3
#kubectl exec $(kubectl get pods | grep mysql | awk '{print $1}') -- /bin/sh -c /scripts/restore_database.sh
kubectl apply -f srcs/influxdb/influxdb.yaml
kubectl apply -f srcs/grafana/grafana.yaml
kubectl apply -f srcs/phpmyadmin/phpmyadmin.yaml
kubectl apply -f srcs/wordpress/wordpress.yaml
kubectl apply -f srcs/nginx/nginx.yaml
kubectl apply -f srcs/ftps/ftps.yaml

echo -e "\n\033[32mProject is ready\033[0m"
