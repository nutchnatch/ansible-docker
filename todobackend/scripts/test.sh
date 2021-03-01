#!/bin/bash	

# activate the virtual environment
. /appenv/bin/activate

# download requirements to build cache
# -d -> destination flag - specifies the folder to download the application dependencies to
pip download -d /build 

# Install application third test requirements and dependencies
pip install --no-index -f -r requirements_test.txt -r requirements_test.txt --no-input

# Run test.sh arguments
exec $@