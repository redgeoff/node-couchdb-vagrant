# node-couchdb-vagrant

A VM for developing nodejs modules that interface with CouchDB


## Install Vagrant, VirtualBox and git

    http://www.vagrantup.com
    https://www.virtualbox.org (don't worry about setting up any VMs as the steps below will cover this)
    http://git-scm.com


## Set up

    $ git clone https://github.com/redgeoff/node-couchdb-vagrant.git
    $ cd node-couchdb-vagrant
    $ vagrant up
    $ vagrant ssh


## Example of how to develop with this VM

### Launch VM

    $ cd node-couchdb-vagrant
    $ vagrant up
    $ vagrant ssh

### Set up a repo, e.g. couch-slouch and run some tests

    $ git clone https://github.com/redgeoff/slouch
    $ cd slouch
    $ npm install
    $ npm run node-full-test


## Fauxton access from host machine

You can access the DB in a browser on the host machine:
- Visit http://192.168.50.11:5984/_utils
- Admin Username: admin
- Admin Password: admin


## Notes

- Files placed in `app` are ignored by this repo.


## Recreate CouchDB Service

WARNING: this will delete all of your existing CouchDB data.

CouchDB can sometimes get into a corrupted state and in this case the easiest fix may be to start refresh:

    $ sudo /vagrant/recreate-couchdb-service.sh
