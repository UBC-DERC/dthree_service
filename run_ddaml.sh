#!/bin/bash

docker run --rm --user "$(id -u):$(id -g)" -v "$PWD:/work" dthree-data-model   data_model/d3ddaml/dairymodel.yaml --docs docs --output data_model/output.yaml
