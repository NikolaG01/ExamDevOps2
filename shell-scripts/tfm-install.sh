#!/bin/bash
echo "* Download TF ... *"
wget https://releases.hashicorp.com/terraform/1.3.7/terraform_1.3.7_linux_amd64.zip -O /tmp/terraform.zip
echo "* Unzip TF ... *"
unzip /tmp/terraform.zip
echo "* Move TF to PATH ... *"
mv terraform /usr/local/bin/
echo "* Remove TF archive ... *"
rm /tmp/terraform.zip