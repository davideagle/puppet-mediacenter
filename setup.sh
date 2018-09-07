sudo apt-get install wget
sudo wget https://apt.puppetlabs.com/puppet-release-bionic.deb
sudo dpkg -i puppet-release-bionic.deb
sudo apt-get update && sudo apt-get upgrade -y
sudo apt-get -y install puppet ruby git jq
sudo gem install r10k -v 2.4.1
sudo git clone https://github.com/davideagle/puppet-mediacenter.git /etc/puppet/modules/mediacenter
sudo ln -s /etc/puppet/modules/mediacenter/Puppetfile /etc/puppet/Puppetfile
cd /etc/puppet/
sudo puppet config set confdir /etc/puppet/modules/
sudo r10k puppetfile install -vv debug
sudo /usr/bin/puppet config set factpath $confdir/facter
sudo /usr/bin/puppet apply /etc/puppet/modules/mediacenter/manifests/mediacenter.pp
