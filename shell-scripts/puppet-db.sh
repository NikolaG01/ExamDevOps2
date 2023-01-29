echo "* Installing the DB modules for Puppet"
puppet module install puppetlabs-vcsrepo
puppet module install puppetlabs-firewall
puppet module install puppetlabs/mysql
sudo cp -vR /etc/puppetlabs/code/environments/production/modules/ /etc/puppetlabs/code/