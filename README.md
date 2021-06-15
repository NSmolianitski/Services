# Services

## Introduction

Services is a project about Kubernetes cluster with 7 services:
- Wordpress
- PhpMyAmdin
- MariaDB
- InfluxDB
- Grafana
- FTPS

## How to launch

You will need Miniube to launch this project. If you have one, just launch `setup.sh` script.

## Description

All services are located in different Kubernetes pods. Wordpress and PhpMyAdmin have their own nginx servers and get information from MariaDB databese.
There is a telegraf in each pod that collects all data and sends it to InfluxDB which, in turn, sends it to Grafana to display it on dashboard.
Every service has it's own Dockerfile. Also, there is a metallb loadbalancer which sets the IPs diapason.

## What I learned

- some things about docker
- a lot of information about Kubernetes and services interaction
- Kubernetes principles
