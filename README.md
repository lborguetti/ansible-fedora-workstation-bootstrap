localhost
---

![](https://raw.githubusercontent.com/lborguetti/localhost/master/assets/localhos.jpg)

This project installs and configures most of the software I use on my Fedora Workstation.

## Installation

Makefile simplify our life! I believe you agree with that =)

The only dependency for running this project is ansible and I automated this installation step too.

So, just run `make` for install ansible.

To installs and configures:

```shell
make ansible-playbook "playbook=lo"
```

You can select one of the ansible role using tags, like that:

```shell
make ansible-playbook "playbook=lo" "tags=packages"
```

## Ansible roles/tags availables

See `ansible/localhost.yaml`
