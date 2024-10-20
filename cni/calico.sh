#!/bin/bash

kubectl --kubeconfig=/etc/kubernetes/admin.conf create -f https://raw.githubusercontent.com/projectcalico/calico/v3.28.0/manifests/tigera-operator.yaml >/dev/null
kubectl --kubeconfig=/etc/kubernetes/admin.conf create -f https://raw.githubusercontent.com/projectcalico/calico/v3.28.0/manifests/custom-resources.yaml >/dev/null