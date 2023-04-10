#Interactive run: docker run -it --rm  kubernetesadmin:001 bash 


FROM bitnami/kubectl:latest as kubectl
FROM ubuntu:jammy

#Update
RUN apt-get update
RUN apt-get upgrade
RUN apt-get install curl -y

# Install kubectl
COPY --from=kubectl /opt/bitnami/kubectl/bin/kubectl /usr/local/bin/

#Install istioctl
COPY get-istioctl.sh ./get_istioctl.sh 
RUN chmod 700 get_istioctl.sh
RUN ./get_istioctl.sh
RUN cp /istio-1.17.2/bin/istioctl /usr/local/bin
#RUN export PATH=$PWD/bin:$PATH

#Install Helm
COPY get-helm.sh ./get_helm.sh 
RUN chmod 700 get_helm.sh
RUN ./get_helm.sh

CMD ["/bin/bash"]

