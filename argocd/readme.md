#Get Latest argo-cd
curl https://raw.githubusercontent.com/argoproj/argo-cd/stable/manifests/install.yaml -o argo-cd.yaml

#Install
kubectl apply -f argo-namespace.yaml
kubectl apply -f argo-cd.yaml -n argocd

##Get Inital password (user: admin) -- Need to wait till services start
kubectl -n argocd get secret argocd-initial-admin-secret -o jsonpath="{.data.password}" | base64 -d

##Bootstrap Installs
kubectl apply -f argo-bootstrap.yaml


##Inital access to Web
kubectl port-forward svc/argocd-server -n argocd 8080:80


B1V92kxHFdYW1kIB