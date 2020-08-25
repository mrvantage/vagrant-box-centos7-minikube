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
To be able to build the box yourself, you'll need at least following tools installed:

* [Virtualbox](https://www.virtualbox.org/) (tested with version 6.1.12)
* [Vagrant](https://www.vagrantup.com/) (tested with version 2.2.9)
* [Packer](https://www.packer.io/) (tested with version 1.6.0)

The build wil be uploaded to Vagrant Cloud, so you'll need an account and corresponding token there. On top of that, the box has to be pre-created for the upload to succeed.

## Usage
1. Make sure you have a Vagrant Cloud account with an authentication token. You need to have "admin" access to the Vagrant Cloud box, or you need to be the owner of the box for the upload to work automatically. This token can be created via [`Account settings -> Security`](https://app.vagrantup.com/settings/security). You can enter the username and token when requested by the `build.sh` script (but you will need to do this every time when creating a new build), or you can create a file `build.env` in the root of this repository where you set the variables as follows:

```
DEFAULT_VAGRANT_CLOUD_USER="your.username"
DEFAULT_VAGRANT_CLOUD_TOKEN="your.vagrant.cloud.token"
```

2. The script will update box `mrvantage/centos7-minikube`. This name is hardcoded in the scripts. If you wish to create a box in your own account, change the following two environment variables in `build.sh`:

```
export VAGRANT_CLOUD_BOX_USER="mrvantage"
export VAGRANT_CLOUD_BOX_NAME="centos7-minikube"
```

3. Make your changes, and commit them in your local git repository.
4. From this project's root directory run the build.sh bash script:
```
./build.sh
```
5. The packer Vagrant builder will create and package your new box in a file named `build/package.box`.
6. Vagrant cloud post-processor will create a new version and upload the box to the Vagrant Cloud.
7. If the box build succeeded, the script will automatically create a tag in your local git repository. If you are happy with the results, push to GitHub, and create a GitHub release based on the tag.
8. Finally, log into your Vagrant Cloud and release the box to make it available for everybody, and publish the GitHub release.
9. Get yourself a celebratory beer!

## Using the base box
You can use the base box like any other base box. The box itself is provisioned with Ansible, so if you wish to use Ansible in your provisioning process, you do not need to install Ansible again, as this is already part of the base box.

Configure your `Vagrantfile` as follows to re-use the pre-installed Ansible:

```
# Provision using Ansible, using the pre-installed Ansible in the base box
config.vm.provision :ansible_local do |ansible|
    ansible.playbook = "playbook.yml"
    ansible.install = false
    ansible.compatibility_mode = "2.0"
    ansible.become = true
end
```

## Changelog
You can find the changelog [here](CHANGELOG.md).

## License
This code is licensed under the [Apache 2.0 license](LICENSE).