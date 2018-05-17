#!/bin/bash -eux

echo '==> Attaching Red Hat subscriptions'
subscription-manager register --username $RHN_USERNAME --password $RHN_PASSWORD --auto-attach
echo '==> Subscriptions successfully attached'

