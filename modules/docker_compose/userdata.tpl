Content-Type: text/x-shellscript; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="user-script.txt"

#!/bin/bash -v

NEW_HOSTNAME="${node_name}"
hostname $NEW_HOSTNAME
echo $NEW_HOSTNAME > /etc/hostname
PRIVATE_IP=$(curl http://169.254.169.254/latest/meta-data/local-ipv4)
echo "$PRIVATE_IP $NEW_HOSTNAME" >> /etc/hosts

####################
# install package
apt-get update

# install aws-cli
apt-get install -y python-pip jq git
pip install awscli boto3

# install docker
curl -fsSL https://get.docker.com/ | sh

(
cat << 'EOP'
{
"experimental": true
}
EOP
) > /etc/docker/daemon.json

systemctl restart docker

docker version

# install docker-compose
curl -L "https://github.com/docker/compose/releases/download/${compose_version}/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
chmod +x /usr/local/bin/docker-compose

docker-compose version

# initialize swarm cluster
docker swarm init

####################
# aws configure
mkdir -p ~/.aws
(
cat << 'EOP'
[default]
region = ap-northeast-1
EOP
) > ~/.aws/config


####################
# useradd

useradd -m -s /bin/bash -g docker docker

aws s3 sync s3://"${env_bucket_path}" /home/docker/

# encrypt command is as follows:
# aws kms encrypt --key-id ${kms_key_id} --plaintext fileb:///home/docker/.profile --output text --query CiphertextBlob | base64 --decode > /home/docker/.profile.enc

aws kms decrypt --ciphertext-blob fileb:///home/docker/.profile.enc --output text --query Plaintext | base64 --decode > /home/docker/.profile
chown -R docker:docker /home/docker/.profile

####################

###################
# custom useradd
##################
(
cat << 'EOP'
#!/bin/bash
if [ $# -ne 2 ]; then
  echo "custom_useradd.ssh os_username github_username" 1>&2
  exit 1
fi
useradd -m -s /bin/bash $1
mkdir /home/$1/.ssh
curl https://github.com/$2.keys >> /home/$1/.ssh/authorized_keys
chown -R $1:$1 /home/$1/.ssh
chmod 700 /home/$1/.ssh
chmod 600 /home/$1/.ssh/authorized_keys
gpasswd -a $1 sudo
echo "$1 ALL=(ALL) NOPASSWD: ALL" > /etc/sudoers.d/$1
EOP
) > /root/custom_useradd.sh

chmod +x /root/custom_useradd.sh

${custom_commands}
