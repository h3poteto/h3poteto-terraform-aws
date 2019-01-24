#!/bin/bash
set -o xtrace
/etc/eks/bootstrap.sh --apiserver-endpoint "${master_endpoint}" --b64-cluster-ca "${certificate_authority}" "${name}"
