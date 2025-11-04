#!/usr/bin/env sh
#
# Build and run the example Docker image.
#
# Mounts the local project directory to reflect a common development workflow.
#
# The `docker run` command uses the following options:
#
#   --rm                        Remove the container after exiting
#   --volume .:/workspace       Mount the current directory to `/workspace` so code changes don't require an image rebuild
#   --volume /workspace/.venv   Mount the virtual environment separately, so the developer's environment doesn't end up in the container
#   --publish 8000:8000         Expose the web server port 8000 to the host
#   -it $(docker build -q .)    Build the image, then use it as a run target
#   $@                          Pass any arguments to the container (prefixed with 'uv run' if arguments provided)

if [ -t 1 ]; then
    INTERACTIVE="-it"
else
    INTERACTIVE=""
fi

# If arguments are provided, prefix them with 'uv run' to execute project scripts
if [ $# -gt 0 ]; then
    set -- uv run "$@"
fi

docker run \
    --rm \
    --volume .:/workspace \
    --volume /workspace/.venv \
    --publish 8000:8000 \
    $INTERACTIVE \
    $(docker build -q -f docker/Dockerfile .) \
    "$@"
