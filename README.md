# Packer RHEL 7 #

Build a Vagrant box for RHEL7 using Packer. Currently it only supports Virtualbox.

This Packer template will register with Red Hat, create the VM, then unregister from Red Hat and cleanup.

Set `RHN_USERNAME` and `RHN_PASSWORD` in your environment prior to running `packer build rhel7.json`.

# Virtualbox Guest Additions #

Packer will automatically download the proper guest additions for the version of VirtualBox that is running and upload those guest additions into the virtual machine so that provisioners can easily install them.

Packer downloads the guest additions from the official VirtualBox website, and verifies the file with the official checksums released by VirtualBox.

After the virtual machine is up and the operating system is installed, Packer uploads the guest additions into the virtual machine. The path where they are uploaded is controllable by guest_additions_path, and defaults to "VBoxGuestAdditions.iso". Without an absolute path, it is uploaded to the home directory of the SSH user.