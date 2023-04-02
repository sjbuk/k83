#STEP 1 INSTALL ISTIO DEFAULT PROFILE
istioctl install --set profile=default --skip-confirmation

#step 2 Install
kubectl apply -f argocd\argo-namespace.yaml
kubectl apply -f argocd\argo-cd.yaml -n argocd

##Get Inital password (user: admin) -- Need to wait till services start
kubectl -n argocd get secret argocd-initial-admin-secret -o jsonpath="{.data.password}" | base64 -d
kubectl port-forward svc/argocd-server -n argocd 8080:80

!Test loging

-- Snapshot c-m4v9p-ml-qgcfg - 02/04/23 17:11 - Argocd installed



#!NOW VIA ARGOCD STEP 2 Install MetalLB
 kubectl kustomize .\metallb\environments\dev