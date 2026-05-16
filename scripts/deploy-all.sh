#!/usr/bin/env bash
set -euo pipefail

export AWS_REGION="${AWS_REGION:-us-west-2}"

./scripts/create.sh udagram-network templates/network.yml parameters/network-parameters.json
./scripts/create.sh udagram-servers templates/servers.yml parameters/servers-parameters.json
