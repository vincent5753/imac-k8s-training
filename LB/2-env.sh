#!/bin/bash
# By VP@23.07.05

kubectl create deployment hello-server --image=gcr.io/google-samples/hello-app:1.0 --replicas=3
kubectl get po
kubectl expose deployment hello-server --type LoadBalancer --port 80 --target-port 8080
