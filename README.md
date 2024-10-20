# Provisioning Kubernetes on Hetzner Cloud

This project automates the provisioning of a Kubernetes cluster on Hetzner Cloud using Terraform


1. add terraform credentials under '~/.terraform.rc'

```bash
credentials app.terraform.io" {
      "token": "YOUR_TOKEN"
}
```
**If you don't want to use remote backend, delete the remote.tf file**

2. navigate to keys/ and run the following to generate ssh keys

```bash
ssh-keygen -t ed25519
```
set the path as .


3. set the values of variables on terraform.tfvars.example

```
hcloud_token         = "YOUR_TOKEN"
hcloud_location      = "fsn1"
subnet_zone          = "eu-central"
hcloud_network_range = "10.0.0.0/8"
hcloud_subnet_range  = "10.244.0.0/16"
master_count         = 1
worker_count         = 2
master_type          = "cpx21"
worker_type          = "cpx31"
cni                  = "flannel"
cidr                 = "192.168.0.0/16"
image                = "SNAPSHOT_ID"
ssh_public_key_path  = "./keys/id_ed25519.pub"
ssh_private_key_path = "./keys/id_ed25519"
```
you can change them according to your need
```bash
mv terraform.tfvars.example terraform.tfvars
```

4. review your configuration then apply 

```bash
terraform plan
terraform apply
```


4. use remote backend if needed create remote.tf file with the following

```
terraform {
  backend "remote" {
    organization = "ORG_NAME"

    workspaces {
      prefix = "PREFIX-"
    }
  }
}
```
list all workspaces
```
terraform workspace list
```
switch workspaces using
```
terraform workspace select WORKSPACE_NAME
```

![arch](arch.png)