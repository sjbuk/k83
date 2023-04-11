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
kubectl exec -n vault --stdin=true --tty=true vault-0 -- vault operator unseal wSpD17eB1BE1XHe+La0Zh8AI1rkTIg2Ali/2hn47PpLt
kubectl exec -n vault --stdin=true --tty=true vault-0 -- vault operator unseal zLaGT4otuu546H6dEJLLxq5NBXwi5j0KO3VrTFfH8ldI
kubectl exec -n vault --stdin=true --tty=true vault-0 -- vault operator unseal 80CLcaNx3bGtcPVzYAgqMSd/vEDjTuuUBzJFSNGhSuXN


Unseal Key 1: wSpD17eB1BE1XHe+La0Zh8AI1rkTIg2Ali/2hn47PpLt
Unseal Key 2: zLaGT4otuu546H6dEJLLxq5NBXwi5j0KO3VrTFfH8ldI
Unseal Key 3: 80CLcaNx3bGtcPVzYAgqMSd/vEDjTuuUBzJFSNGhSuXN
Unseal Key 4: gL+jHVijzz/fcgbAVvNUsGdDx85hW9XGQAmSIKTwFWIb
Unseal Key 5: Jl4rcencUJ/gANCLWYG+KHSLVUqpH7aO0otTwAq2uFC3

Initial Root Token: hvs.ukY6cXqIVrMIz6tPbnbzkxPX

ACME
dmBN-fErPJ_a5495Ia7xjA

jP2uHZfj1j_Y7LQkVQWnX7neRORGPIjvTdYQbHjts5BmuUXGtMBHmKTgXAODB_El3lQnXjfF_2zVTZJzGE672w




kubectl exec -n vault --stdin=true --tty=true vault-0 -- vault write pki/root/generate/internal common_name=kind.com  ttl=8760h

vault write pki/root/generate/internal \
    common_name=kind.com \
    ttl=8760h

    vault write pki/roles/kind-dot-com \
    allowed_domains=example.com \
    allow_subdomains=true \
    max_ttl=72h

