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


apt-get install -y \
build-essential \
zlib1g-dev \
libssl-dev \
libreadline-dev \
libyaml-dev \
libxml2-dev \
libxslt-dev \
libmysqlclient-dev \
mysql-client \
nginx


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

groupadd rails
useradd -m -s /bin/bash -g rails rails

aws s3 sync s3://"${env_bucket_path}" /home/rails/

# encrypt command is as follows:
# aws kms encrypt --key-id ${kms_key_id} --plaintext fileb:///home/rails/.profile --output text --query CiphertextBlob | base64 --decode > /home/rails/.profile.enc

aws kms decrypt --ciphertext-blob fileb:///home/rails/.profile.enc --output text --query Plaintext | base64 --decode > /home/rails/.profile
chown -R rails:rails /home/rails/.profile

###################
# rbenv

git clone https://github.com/sstephenson/rbenv.git /home/rails/.rbenv
mkdir -p /home/rails/.rbenv/plugins
git clone https://github.com/sstephenson/ruby-build.git /home/rails/.rbenv/plugins/ruby-build
chown -R rails:rails /home/rails/.rbenv
echo 'export PATH="$HOME/.rbenv/bin:$PATH"' >> /home/rails/.bash_profile
echo 'eval "$(rbenv init -)"' >> /home/rails/.bash_profile
chown rails:rails /home/rails/.bash_profile
echo "test -r ~/.profile && source ~/.profile" >> /home/rails/.bash_profile
sed -i -e "1itest -r ~/.profile && source ~/.profile" /home/rails/.bashrc

sudo -u rails -i rbenv install ${ruby_version}
sudo -u rails -i bash -c "rbenv global ${ruby_version} && gem install bundler"

###################
# directory

mkdir /srv/www/
chown rails:rails /srv/www

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
