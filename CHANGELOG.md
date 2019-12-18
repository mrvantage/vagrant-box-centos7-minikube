## Changelog
### 1.0.3-20191218
* Provisioning is now running using Ansible 2.9.2
* Updated kubectl to 1.17.0, and installing it via official yum packages
* Updated minikube to 1.6.1
* Updated Docker CE to 19.03.5
* Added Helm 3.0.2 to the base image

### 1.0.2-20191015
* Updated kubectl to 1.16.1
* Kubectl tab to complete enabled for vagrant user by default
* Selinux is now disabled by default
* Vagrant user is now member of docker group

### 1.0.1-20191004
* Updated automatic box version description on Vagrant Cloud.
* Moved changelog to own file
* Add directory /vagrant to prevent vagrant up from failing

### 1.0.0-20190929
* Initial version.