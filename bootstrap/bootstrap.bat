rem kubectl create namespace argocd
rem kubectl apply -n argocd -f https://raw.githubusercontent.com/argoproj/argo-cd/stable/manifests/install.yaml
rem istioctl install --set profile=default
kubectl apply -f .\bootstrap.yaml
