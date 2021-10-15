#!/bin/bash -eux

if [[ $PACKER_BUILDER_TYPE =~ virtualbox ]]; then
    echo "==> Installing VirtualBox guest additions"
    # Assume that we've installed all the prerequisites:
    # kernel-headers-$(uname -r) kernel-devel-$(uname -r) gcc make perl
    # from the install media via ks.cfg

    VBOX_VERSION=$(cat /home/vagrant/.vbox_version)
    mount -o ro,loop /home/vagrant/VBoxGuestAdditions_$VBOX_VERSION.iso /mnt
    sh /mnt/VBoxLinuxAdditions.run --nox11
    umount /mnt
    rm -rf /home/vagrant/VBoxGuestAdditions_$VBOX_VERSION.iso
    rm -f /home/vagrant/.vbox_version

    # UPDATE 10/14/2021 - Removed since errors with removing these packages in RHEL 8
    #echo "==> Removing packages needed for building guest tools"
    #yum -y remove gcc cpp kernel-devel kernel-headers perl
fi
