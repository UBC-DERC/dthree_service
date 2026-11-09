# syntax=docker/dockerfile:1
# Builds the DDAML model in d3ddaml/ with the data-model package
# at https://github.com/UBC-DERC/data_model
# Building the model validates the ddaml/yaml and writes the
# resolved model (output.yaml) along with Markdown documentation.
#
# This project is used both to support our own research, but also
# as proof of concept for the ddaml specification. So the Dockerfile
# supports two build targets:
#
#   release (default): install a pinned data-model version from the Github repo.
#   local:             install from a local data_model checkout, to test
#                      unreleased changes. From the repository root:
#                      docker build --target local \
#                        --build-context data_model_src=../data_model \
#                        -t dthree-data-model data_model
#
# Run from the repository root (see README):
#   docker run --rm --user "$(id -u):$(id -g)" -v "$PWD:/work" dthree-data-model \
#     data_model/d3ddaml/dairymodel.yaml --docs docs --output data_model/output.yaml

ARG PYTHON_VERSION=3.12
FROM python:${PYTHON_VERSION}-slim AS base
COPY --from=ghcr.io/astral-sh/uv:0.11.20 /uv /bin/uv
ENV UV_SYSTEM_PYTHON=1 UV_NO_CACHE=1
WORKDIR /work
ENTRYPOINT ["data-model"]
CMD ["--help"]

# Local build target:
FROM base AS local
COPY --from=data_model_src . /src
RUN uv pip install /src

# Release build target:
FROM base AS release
# Until data-model is on PyPI, install from a git tag. After the beta:
#   --build-arg DATA_MODEL_SPEC="data-model==2026.11.0b1"
ARG DATA_MODEL_SPEC="data-model @ git+https://github.com/UBC-DERC/data_model@2026-11-alpha"
RUN apt-get update \
 && apt-get install -y --no-install-recommends git \
 && rm -rf /var/lib/apt/lists/*
RUN uv pip install "${DATA_MODEL_SPEC}"
