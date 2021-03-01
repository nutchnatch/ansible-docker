FROM ubuntu:trusty
MAINTAINER Nivaldo Monteiro <nushnivaldo@gmail.com>

# Prevents docker pckg errors
ENV TERM=xterm-250color

# Set ubuntu repository mirrors to a local regional mirror using find and replace sed command to speed up installtion time

# Install Python runtime
RUN apt-get update && \
	apt-get install  -y \
	-o APT::Install-Recommend=false -o APT::Install-Suggests=false \	# recomend not to install packages associated with packages specified, so image remains smaller, reduce runtime env attack service
	python python-virtualenv	# create the virtual environment for the application


# Create virtual environment
# Upgrade PIP  in virtual environment to latest version
RUN virtualenv /appenv && \
	. /appenv/bin/activate && \	# activate virtual environment
	pip install  pip --Upgrade	# upgrate pip to the latest version

# Add entrypoint  script
ADD scripts/entrypoint.sh /usr/local/bin/entrypoint.sh	# copy entrypoint.sh to the image, so it can be accessed from within the container
RUN chmod +x /usr/local/bin/entrypoint.sh	# added execution permission
ENTRYPOINT ["entrypoint.sh"] # specify the script as the entrypoint of the image