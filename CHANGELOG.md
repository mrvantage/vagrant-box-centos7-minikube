## Changelog
### 1.2.0-20210126
* Refactored base box, no longer using upstream centos/7 box, but building from scratch from the CentOS minimal ISO
* Made sure VirtualBox guest additions 6.1.18 are installed and running

### 1.1.4-20210125
* Updated Minikube to version 1.17.0
* Fixed installation of pip now that Python 2 is no longer supported in pip 21.0

### 1.1.3-20210121
* Added some yum packages to facilitate updating the VirtualBox Guest Additions in the later usage of the base box
* Updated Ansible to version 2.10.5
* Updated Minikube to version 1.16.0
* Updated Docker to version 20.10.2
* Updated kubectl to version 1.20.2
* Updated Helm to version 3.5.0
* Updated Virtualbox dependency to version 6.1.18r142142
* Updated Packer dependency to version 1.6.6
* Updated Vagrant dependency to version 2.2.14

### 1.1.2-20201105
* Updated Ansible to version 2.10.3
* Updated Minikube to version 1.14.2
* Updated kubectl to version 1.19.3
* Updated Helm to version 3.4.0
* Updated Virtualbox dependency to version 6.1.16r140961
* Updated Packer dependency to version 1.6.3

### 1.1.1-20200929
* Updated Ansible to version 2.10.0
* Updated kubectl to version 1.19.2
* Updated Helm to version 3.3.4
* Updated Packer dependency to version 1.6.2
* Add kubetail to the image, version 1.6.14

### 1.1.0-20200901
* Updated Ansible to version 2.9.13
* Updated kubectl to version 1.19.0
* Updated Helm to version 3.3.1
* Updated Packer dependency to version 1.6.1
* Add kubetail to the image, version 1.6.12

### 1.0.7-20200814
* Updated Ansible to version 2.9.12
* Updated Minikube to version 1.12.3
* Updated Docker CE to version 19.03.12
* Updated kubectl to version 1.18.8
* Updated Helm to version 3.3.0
* Updated Packer dependency to version 1.6.1

### 1.0.6-20200724
* Updated CentOS base box to version 2004.01
* Updated Ansible to version 2.9.10
* Updated Minikube to version 1.12.0
* Updated Docker CE to version 19.03.11
* Updated kubectl to version 1.18.5
* Updated Helm to version 3.2.4
* Updated VirtualBox Guest Additions to 6.1.12
* Updated Packer configuration files to work with Packer 1.6.0
* Added the possibility to pre-configure the Vagrant cloud username and token
* Added conntrack-tools pre-installed in the base box image
* Added checks to make sure all required tools are installed before building
* Refactored hardcoded stuff in various places
* Made sure variables for software versions are only used once in all build scripts
* Updated documentation to make it easier for someone else to build a box

### 1.0.5-20200121
* Updated minikube to 1.6.2
* Updated VirtualBox Guest Additions to 6.0.16

### 1.0.4-20191219
* Changed minikube configuration to allow NodePort services on port numbers 1024-65535
* Installed some troubleshooting tools in the image: telnet, tcpdump
* Fixed small issues with the helm installation

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