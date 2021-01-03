#!/bin/bash

kubectl delete pods nginx
kubectl apply -f srcs/nginx.yaml
kubectl get pods
