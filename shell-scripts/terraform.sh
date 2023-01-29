#!/bin/bash

echo "* Run the RabbitMq cluster ..."
terraform -chdir=/vagrant/tfm-1-monitoring init
terraform -chdir=/vagrant/tfm-1-monitoring apply -auto-approve

echo "* Run the RabbitMq producers and consumers ..."
terraform -chdir=/vagrant/tfm-2-rabbitmq init
terraform -chdir=/vagrant/tfm-2-rabbitmq apply -auto-approve

echo "* Run the monitoring components ..."
terraform -chdir=/vagrant/tfm-3-app init
terraform -chdir=/vagrant/tfm-3-app apply -auto-approve