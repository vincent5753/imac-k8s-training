#!/bin/bash
# By VP@23.07.05
# ref: https://metallb.universe.tf/installation/

read -p "我假設你已經裝好 Kubernetes ，沒問題的話按 Enter 繼續" Enter

echo "讓你看看有什麼會被改"
kubectl get configmap kube-proxy -n kube-system -o yaml | \
sed -e "s/strictARP: false/strictARP: true/" | \
kubectl diff -f - -n kube-system
sleep 3

echo "幫你搞好了"
kubectl get configmap kube-proxy -n kube-system -o yaml | \
sed -e "s/strictARP: false/strictARP: true/" | \
kubectl apply -f - -n kube-system

echo "Apply MetalLB YAML"
kubectl apply -f https://raw.githubusercontent.com/metallb/metallb/v0.13.10/config/manifests/metallb-native.yaml
echo "MBL 相關資源"
kubectl get all --namespace metallb-system
