# this is a development image which will be used to run unit and integration tests, and used to build application artifacts
FROM jmenga/todobackend-base:latest
MAINTEINER Nivaldo Monteiro <nushnivaldo@gmail.com>

# Install dev/build  dependencies
RUN apt-get update && \
	apt-get install qy python-dev libmysqlclient-dev 	# Installs the dev packages necessary to deploy a python application

# Activate virtual environment and install wheel support
RUN . /appenv/bin/activate && \
	pip install wheel --upgrade 

# PIP environment variables  (NOTE: must be set after installing  wheel)
ENV WHEELHOUSE=/whelhouse PIP_WHEEL_DIR=/wheelhouse XDG_CACHE_HOME=/cache

# OUTPUT: Builds artifacts (wheels) are output here
# Creation of two volumes
VOLUME /wheelhouse

VOLUME /build

# Volume used to dollect artifacts as test and coverage reports
VOLUME /reports

# Add test entrypoint script
COPY scripts/test.sh /usr/local/bin/test.sh
RUN chmod +x /usr/local/bin/test.sh

ENTRYPOINT ["test.sh"]

# Command that we pass to the entrypoint script
CMD ["python", "manage.py", "test", "--noinput"]

# Add application source code
COPY src/application
# This is where most of the changes will occur
WORKDIR /application

# since most of the undelined images will not be changes often, they will be cached, improveing the performance