kubectl create namespace vault
helm install vault hashicorp/vault   --namespace vault  -f vault-values.yaml 


helm install vault hashicorp/vault --namespace vault --set "server.ha.enabled=true"   --set "server.ha.replicas=2"   --dry-run

helm install vault hashicorp/vault --namespace vault --set "server.ha.enabled=true"   --set "server.ha.replicas=2"   --dry-run

PS C:\Users\stuar> kubectl exec -n vault --stdin=true --tty=true vault-0 -- vault operator init
Unseal Key 1: xIrTAngug1oQj39rtKxa+m3tRZTj87il/NsTpBlXGIUM
Unseal Key 2: WXBBRx7akmw6hM8uIke7PgkDDljZ/aG4V4od8iPOvera
Unseal Key 3: 65JecN2w7ZWZqybw6YIjilW0234zHiYBN5gR5Qra4TyG
Unseal Key 4: AaUH2mtaVPO4dGLqnh3MIeL0g8Gzb6SDmuv3e5itiSf9
Unseal Key 5: y+qHhxPp5egmz81/dp+WdLdrKUtS1MGSig83Kzz+tvrw

Initial Root Token: hvs.CK7EyyKu58H7MHiZP2KchWBE



## Unseal the first vault server until it reaches the key threshold
kubectl exec -n vault --stdin=true --tty=true vault-0 -- vault operator unseal xIrTAngug1oQj39rtKxa+m3tRZTj87il/NsTpBlXGIUM
kubectl exec -n vault --stdin=true --tty=true vault-0 -- vault operator unseal WXBBRx7akmw6hM8uIke7PgkDDljZ/aG4V4od8iPOvera
kubectl exec -n vault --stdin=true --tty=true vault-0 -- vault operator unseal 65JecN2w7ZWZqybw6YIjilW0234zHiYBN5gR5Qra4TyG
