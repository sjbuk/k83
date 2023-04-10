#Interactive run: docker run -it --rm --network="host"  -v c:\users\stuar\.kube:/root/.kube -v d:\dev:/root/dev  sjbuk/k8sadmin:01.00.00 /bin/bash

#Vault download https://developer.hashicorp.com/vault/downloads



FROM bitnami/kubectl:latest as kubectl
FROM ubuntu:jammy

#Update
RUN apt-get update
#RUN apt-get upgrade
RUN apt-get install curl openssl git jq -y



# Install kubectl
COPY --from=kubectl /opt/bitnami/kubectl/bin/kubectl /usr/local/bin/


#Install istioctl
COPY get-istioctl.sh /home/get_istioctl.sh 
RUN chmod 700 /home/get_istioctl.sh
RUN cd /home
RUN /home/get_istioctl.sh
RUN mv /istio-1.17.2 /home/istio-1.17.2
RUN cp /home/istio-1.17.2/bin/istioctl /usr/local/bin

#Install Vault
#Vault download https://developer.hashicorp.com/vault/downloads

COPY vault /usr/local/bin


#Install Helm
COPY get-helm.sh /home/get_helm.sh 
RUN chmod 700 /home/get_helm.sh
RUN /home/get_helm.sh



#Onstall k9s
RUN curl -sS https://webinstall.dev/k9s | bash

#Krew Install
RUN set -x; cd "$(mktemp -d)"
RUN curl -fsSLO https://github.com/kubernetes-sigs/krew/releases/latest/download/krew-linux_amd64.tar.gz 
RUN tar zxvf "krew-linux_amd64.tar.gz"
RUN ./"krew-linux_amd64" install krew
RUN echo "export PATH="${KREW_ROOT:-$HOME/.krew}/bin:$PATH"" >> ~/.bashrc
ENV PATH="/root/.krew/bin:$PATH" 

#Install kubectx and kubens
RUN kubectl krew install ctx
RUN kubectl krew install ns


CMD ["/bin/bash"]

