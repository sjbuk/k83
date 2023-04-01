#STEP 1 INSTALL ISTIO DEFAULT PROFILE
istioctl install --set profile=default --skip-confirmation

#STEP 2 Install MetalLB
 kubectl kustomize .\metallb\environments\dev

--kubectl apply -f https://raw.githubusercontent.com/metallb/metallb/v0.13.7/config/manifests/metallb-native.yaml
--kubectl wait --namespace metallb-system --for=condition=ready pod --selector=app=metallb  --timeout=90s

#STEP 3 INSTALL ARGOCD
kubectl create namespace argocd
kubectl apply -n argocd -f https://raw.githubusercontent.com/argoproj/argo-cd/stable/manifests/install.yaml




ARGO CD Install

kubectl create namespace argocd
kubectl apply -n argocd -f https://raw.githubusercontent.com/argoproj/argo-cd/stable/manifests/install.yaml



kubectl apply -f https://raw.githubusercontent.com/istio/istio/release-1.17/samples/sleep/sleep.yaml
kubectl apply -f https://raw.githubusercontent.com/istio/istio/release-1.17/samples/helloworld/helloworld.yaml


IP ADDRESSES
10.111.1.120 - 10.111.1.239  - DHCP
10.111.1.50  - 10.111.1.70 - K8s LoadBalancer

kubectl exec --namespace vault --stdin --tty vault-0 -- vault operator unseal ikwYsgHbf57LX+fVoe64QlsZLHfBFbbvLwnxo/5XXvUo

Unseal Key 1: FQRv0yIOVY+LMDqOLTa1w941mLo+W/LahJ9dKFq9eDlj
Unseal Key 2: PVbAM7957LMVdg3nlx1qBedXkCWspCJwIc1G+Kn9bpuD
Unseal Key 3: hdUSCJBVdHb8fIOhHYqIjcVXFai6s6JSTJLfExwsLycG
Unseal Key 4: ikwYsgHbf57LX+fVoe64QlsZLHfBFbbvLwnxo/5XXvUo
Unseal Key 5: HRilWGPhD1xZfkpbPZ286o/SvEZ8ke46sE7HWhlwdkvQ

Initial Root Token: hvs.xXKIX7mEKqiPJNQ9edjYzSh0

vault kv put internal/database/config username="db-readonly-username" password="db-secret-password"