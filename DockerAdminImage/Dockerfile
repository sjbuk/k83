FROM bitnami/kubectl:latest as kubectl
FROM ubuntu:jammy

#Update
RUN apt-get update
RUN apt-get upgrade
RUN apt-get install curl -y

# Install kubectl
COPY --from=kubectl /opt/bitnami/kubectl/bin/kubectl /usr/local/bin/

#Install istioctl
RUN curl -L https://istio.io/downloadIstio | sh -

#Install Helm
COPY get-helm.sh ./get_helm.sh 
RUN chmod 700 get_helm.sh
RUN ./get_helm.sh

CMD ["/bin/bash"]

