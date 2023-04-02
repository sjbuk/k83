#Get Latest argo-cd
curl https://raw.githubusercontent.com/argoproj/argo-cd/stable/manifests/install.yaml -o argo-cd.yaml

#Install
kubectl apply -f argo-namespace.yaml
kubectl apply -f argo-cd.yaml -n argo-cd

##Get Inital password (user: admin)
kubectl -n argo-cd get secret argocd-initial-admin-secret -o jsonpath="{.data.password}" | base64 -d

##Inital access to Web
kubectl port-forward svc/argocd-server -n argo-cd 8080:443
