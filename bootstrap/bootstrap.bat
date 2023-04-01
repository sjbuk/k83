kubectl apply -f https://github.com/sjbuk/k83/blob/main/bootstrap/bootnamespaces.yaml?raw=true

kubectl apply -n argocd -f https://raw.githubusercontent.com/argoproj/argo-cd/stable/manifests/install.yaml
istioctl install --set profile=default --skip-confirmation

kubectl apply -f https://github.com/sjbuk/k83/blob/main/bootstrap/bootstrap.yaml?raw=true


kubectl apply -f https://raw.githubusercontent.com/istio/istio/release-1.17/samples/addons/prometheus.yaml
kubectl apply -f https://raw.githubusercontent.com/istio/istio/release-1.17/samples/addons/kiali.yaml
kubectl apply -f https://raw.githubusercontent.com/istio/istio/release-1.17/samples/addons/grafana.yaml


echo off
echo argocd password
kubectl -n argocd get secret argocd-initial-admin-secret -o jsonpath="{.data.password}" | base64 -d
echo:
echo on


