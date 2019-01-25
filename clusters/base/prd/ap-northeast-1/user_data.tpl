#!/bin/bash
curl "https://bootstrap.pypa.io/get-pip.py" -o "get-pip.py"
python get-pip.py
export PATH=$PATH:/usr/local/bin
pip install awscli
REGION=ap-northeast-1
INSTANCE_ID=$(curl -s http://169.254.169.254/latest/meta-data/instance-id)
aws --region $REGION ec2 create-tags --resources "$INSTANCE_ID" --tags Key=${custom_tag_key},Value=${custom_tag_value}

set -o xtrace
/etc/eks/bootstrap.sh --apiserver-endpoint "${master_endpoint}" --b64-cluster-ca "${certificate_authority}" "${name}"
