#!/bin/sh
export AWS_PAGER=""
rm -rf __pycache__
echo "Until OCI Build Container is updated with Terraform and Ansible - installing it now on the container....."
pip3 install ansible
pip3 show ansible
sudo apt-get update && sudo apt-get install -y gnupg software-properties-common
wget -O- https://apt.releases.hashicorp.com/gpg gpg --dearmor | tee /usr/share/keyrings/hashicorp-archive-keyring.gpg
gpg --no-default-keyring --keyring /usr/share/keyrings/hashicorp-archive-keyring.gpg --fingerprint
echo "deb [signed-by=/usr/share/keyrings/hashicorp-archive-keyring.gpg] https://apt.releases.hashicorp.com $(lsb_release -cs) main" | tee /etc/apt/sources.list.d/hashicorp.list
apt-get install terraform
touch ~/.bashrc
terraform -install-autocomplete
chmod a+x bin/aws_env_example.sh
./bin/aws_env_example.sh
python3 vault.py
#Write all the vars to the vault - because there are so many just call a shell script to do it


#cd sdwan-devops/bin
#chmod a+x install_ca.sh
#./install_ca.sh
#install control plane -
#chmod a+x install_cp.sh
#./install_cp.sh




#terraform init
#terraform plan
#terraform apply --auto-approve






