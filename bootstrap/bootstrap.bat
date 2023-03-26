rem kubectl create namespace argocd
rem kubectl apply -n argocd -f https://raw.githubusercontent.com/argoproj/argo-cd/stable/manifests/install.yaml
rem istioctl install --set profile=default
kubectl apply -f https://github.com/sjbuk/k83/blob/a538eeb60f137d7377ca6f1139fe818b1daf4d7a/bootstrap/bootstrap.yaml?raw=true

