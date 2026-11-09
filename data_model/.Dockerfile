# Use a simple Python image
FROM python:3.12-slim

# Install git and curl
RUN apt-get update && \
    apt-get install -y --no-install-recommends git curl ca-certificates && \
    rm -rf /var/lib/apt/lists/*

# Install uv directly from astral.
RUN curl -LsSf https://astral.sh/uv/install.sh | sh

# Add uv to PATH
ENV PATH="/root/.local/bin:${PATH}"

# Set working directory
WORKDIR /app

# Clone the repository
RUN git clone https://github.com/UBC-DERC/data_model/ .

# Run the script when the container starts
CMD ["uv", "run", "main.py"]
