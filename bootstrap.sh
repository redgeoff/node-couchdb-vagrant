#!/usr/bin/env bash

/vagrant/ubuntu.sh

/vagrant/nodejs.sh

/vagrant/phantomjs.sh

/vagrant/chrome.sh

/vagrant/java.sh

/vagrant/docker.sh

/vagrant/couchdb.sh

# Default to app dir
echo "cd /vagrant/app" >> /home/vagrant/.bashrc
