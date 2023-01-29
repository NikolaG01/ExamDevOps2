echo "* Installing the web modules for Puppet"
puppet module install puppetlabs-vcsrepo
puppet module install puppetlabs-firewall
puppet module install puppet-selinux
sudo cp -vR /etc/puppetlabs/code/environments/production/modules/ /etc/puppetlabs/code/