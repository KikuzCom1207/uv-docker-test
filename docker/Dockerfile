FROM ghcr.io/astral-sh/uv:python3.12-bookworm-slim

# Install git (required for pre-commit)
RUN apt-get update && apt-get install -y --no-install-recommends \
    git \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

# Create non-root user
RUN groupadd --gid 1000 coffee-blender \
    && useradd --uid 1000 --gid 1000 --create-home --shell /bin/bash coffee-blender

WORKDIR /workspace

# Run the FastAPI application by default
# Uses `uv run fastapi dev` to ensure the project environment is used/created automatically
# Uses `--host 0.0.0.0` to allow access from outside the container
# Note in production, you should use `fastapi run` instead
CMD ["uv", "run", "fastapi", "dev", "--host", "0.0.0.0", "src/uv_docker_example"]
