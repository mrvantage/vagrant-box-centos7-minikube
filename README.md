# vagrant-box-centos7-minikube
## Description
This project contains everything needed to build the centos7-minikube vagrant box. The box is build using Vagrant's packer tool. Currently only a box for the Virtualbox provider is built.

The box resulting is based on the centos/7 box. I try to keep the builds up to date with the latest version of this box. Several tools are included in the box:
* ansible
* minikube
* docker
* kubectl

Built boxes can be found on [Vagrant Cloud](https://app.vagrantup.com/mrvantage/boxes/centos7-minikube)

## Prerequisites
To be able to build the box yourself, you'll need at least following tools installed.

* Virtualbox (tested with version 6.0.12)
* Vagrant (tested with version 2.2.5)
* packer (tested with version 1.4.3)

The build wil be uploaded to Vagrant Cloud, so you'll need an account and corresponding token there. On top of that, the box has to be pre-created for the upload to succeed.

## Usage
1. Make sure you have a Vagrant Cloud account with an authentication token. This token can be created via [`Account settings -> Security`](https://app.vagrantup.com/settings/security).

2. Create a box under your account named `centos7-minikube`. This name is hardcoded in the scripts
3. From this project's root directory run the build.sh bash script
```
./build.sh
```
4. Provide your Vagrant Cloud username as the script asks for it
```
What is your Vagrant Cloud username? [mrvantage] evenbetterboxes
```
5. Provide a valid cloud token for your account
```
What is your Vagrant Cloud token? 
```
6. Profit!

## Changelog
You can find the changelog [here](CHANGELOG.md)