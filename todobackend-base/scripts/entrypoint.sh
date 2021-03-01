#!/bin/bash	

# activate the virtual environment
. /appenv/bin/activate

# exec command with bash $@ positional parameter specifier
# exec command replaces the current bash shell program with the command string that follow relinquishing control of the current process
# to the specified command without creating a new process
# $@ reprensents all arguments passed to the script
# this means you can pass any command that you want to run to the entrypoint script, and the script will activate the environment and execute
# the supplied command arguments
# example: $ entrypoint.sh python manage.py test	=> "Python manage.py test" command will be all the argument passed to the script, then this command
# will be executed after ". /appenv/bin/activate"

# exec command: the commands passed to entypoint is process ID1 (Pid1) in the container
# entrypoint laundhes the application proccess specified in the command, which linques control of the bash process to the application process
# and finally terminates the bach process
# then, when docker container is stopped, docker daemon sends a sigterm signal or a stop sognal to the parent Pid1, which in this case correctly 
# signals the application process to stop
# so, application proccess terminates gracefully, performing any cleanup and shutdown before it terminates
# If we did not use the exec command, and just ran the command directly in the script, bash would launch a new child application process, and bash would continue to run 
# as the parent Pid1 process.
# Now, if the docker container is stopped, only the bach process receives the sigterm signal, since it is still the parent Pid1 process of the container
# Since bash is not a process manager, it actually ignores the sigterm signal and does not signa the application process to stop
# By default, if a container does not exit wiithin 10 sec, Docker will send a sigkill signal to all container processes, 
# which dorcely kills both the bash and application processesand stops the container
exec $@ 