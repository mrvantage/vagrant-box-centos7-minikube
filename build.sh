#!/bin/bash
# Set version info
BOX_VERSION_BASE=1.0.1

# Set versions requested of main components
export BOX_BASE="centos/7"
export BOX_BASE_VERSION=1905.1
export ANSIBLE_VERSION=2.8.4
export MINIKUBE_VERSION=1.4.0
export DOCKER_VERSION=18.09.9
export KUBECTL_VERSION=1.16.1

# Ask user for vagrant cloud token
echo -n "What is your Vagrant Cloud username? [mrvantage] "
read user
user=${user:-mrvantage}
export VAGRANT_CLOUD_USER=${user}

# Ask user for vagrant cloud token
echo -n "What is your Vagrant Cloud token? "
read -s token
echo ""
export VAGRANT_CLOUD_TOKEN=${token}

# Export dynamic versioning info
export BOX_VERSION=${BOX_VERSION_BASE}-$(date +'%Y%m%d')
commit=$(git --no-pager log -n 1 --format="%H")
export BOX_VERSION_DESCRIPTION="
## Description
This box is based on the centos/7 box. I try to keep the builds up to date with the latest version of this box. When the box boots it contains a running minikube, ready to deploy kubenetes manifests and kubectl is pre configured for the vagrant user.

The box defaults to 2 CPU and 4GB of RAM, it is not advised to limit this.

---

## Versions included in this release
Based on box [${BOX_BASE}](https://app.vagrantup.com/centos/boxes/7) version ${BOX_BASE_VERSION}
* latest updates installed at build time
* ansible ${ANSIBLE_VERSION}
* minikube ${MINIKUBE_VERSION}
* docker ${DOCKER_VERSION}
* kubectl ${KUBECTL_VERSION}

---

$(cat CHANGELOG.md)

---

## Source info
[View source on Github](https://github.com/mrvantage/vagrant-box-centos7-minikube)

Built on commit: \`${commit}\`
"

echo "${BOX_VERSION_DESCRIPTION}"

# Validate build config
echo "Validating build json files"
packer validate packer.json || exit 1

# Run the actual build
echo "Building box version ${BOX_VERSION}"
packer build -force packer.json || exit 1

# Tag git commit for this build
git tag -a "${BOX_VERSION}" -m "Version ${BOX_VERSION} built."