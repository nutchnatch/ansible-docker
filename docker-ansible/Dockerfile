FROM ubuntu:trusty
MAINTAINER Nivaldo Monteiro <....@gmail.com>

# Prevent dpkg errors
ENV TERM=xterm-256color

# Set mirror to NZ
RUN sed -i "s/http:\/\/archive./http:\/\/nz.archive./g" /etc/apt/source.list

# Install ansible
RUN apt-get update -qy  && \
	apt-get install -qy software-properties-common && \
	apt-add-repository -y  ppa:ansible/ansible && \
	apt-get update -qy && \
	apt-get install  -qy ansible

# Add volume for ansible  playbook
VOLUME /ansible
WORKDIR /ansible

# entrypoint - uses a default entrypoint from the image
ENTRYPOINT ["ansible-playbook"]

# the default command string specifies site.yaml as the playbook to run by default
CMD ["site.yaml"]