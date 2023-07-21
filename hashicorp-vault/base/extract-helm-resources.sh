#!/usr/bin/env bash

SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )

KUSTOMIZE_DIR="${SCRIPT_DIR}/helm"
OUTPUT_DIR="${SCRIPT_DIR}/helm-output"
FLAGS='--enable-helm'
YQ_SPLIT_EXP='(.kind | downcase) + "-" + (.metadata.name | downcase)'

pushd "$OUTPUT_DIR"

kustomize build "${KUSTOMIZE_DIR}" ${FLAGS} | yq -s "$YQ_SPLIT_EXP"
rm kustomization.yaml
kustomize init --autodetect

popd
