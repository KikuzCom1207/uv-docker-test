FROM ghcr.io/astral-sh/uv:python3.12-bookworm-slim

WORKDIR /workspace
COPY . .

# Run the FastAPI application by default
# Uses `uv run fastapi dev` to ensure the project environment is used/created automatically
# Uses `--host 0.0.0.0` to allow access from outside the container
# Note in production, you should use `fastapi run` instead
CMD ["uv", "run", "fastapi", "dev", "--host", "0.0.0.0", "src/uv_docker_example"]
