# Packer RHEL

Build a Vagrant box for RHEL using Packer.

Note, it's a good idea to upgrade `packer`, `vagrant` and `virtualbox` to the latest version before building your new machine. One reason is that the process adds the current `vbox guest additions` to the box, so it's best to use the latest version.

This Packer template will perform the following tasks:

- register with Red Hat
- create the VM
- unregister from Red Hat
- cleanup

To register, set `RHN_USERNAME` and `RHN_PASSWORD` in your environment.
```
export RHN_USERNAME=username
export RHN_PASSWORD=password
```

## Examples

```shell
# To build only for `Virtualbox` and override default variable values
packer build -only=virtualbox-iso -var-file=rhel7-vars.json rhel7.json

# Once successful, you can further add the box to vagrant by using the following example:
vagrant box add --name rhel7 box/virtualbox/rhel7-1.0.0.box
```

## Virtualbox Guest Additions

Packer will automatically download the proper guest additions for the version of VirtualBox that is running and upload those guest additions into the virtual machine so that provisioners can easily install them.

Packer downloads the guest additions from the official VirtualBox website, and verifies the file with the official checksums released by VirtualBox.

After the virtual machine is up and the operating system is installed, Packer uploads the guest additions into the virtual machine. The path where they are uploaded is controllable by guest_additions_path, and defaults to "VBoxGuestAdditions.iso". Without an absolute path, it is uploaded to the home directory of the SSH user.
