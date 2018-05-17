#!/bin/bash -eux

echo '==> Removing Red Hat subscriptions'
subscription-manager remove --all
subscription-manager unregister
subscription-manager clean
echo '==> Subscriptions successfully removed'

