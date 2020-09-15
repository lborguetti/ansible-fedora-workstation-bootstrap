ansible-fedora-workstation-bootstrap
---

This project installs and configures most of the software I use on my Fedora Workstation.

## Requirements

### Clone this repository

```shell
git clone https://github.com/lborguetti/ansible-fedora-workstation-bootstrap
```

### Install ansible (you could use virtualenv and pip).

```shell
cd ansible-fedora-workstation-bootstrap
sudo dnf install python3-virtualenv make
virtualenv --system-site-packages .venv
source .venv/bin/activate
pip install ansible
```

### Provision

```shell
make provision
```

You can select one of part of provisioning using tags. The tags available are
`dns`, `dotfiles`, `iptables`, `ipv6`, `nvim`, `keybase`, `packages` and `zoom`.

```shell
make provision "tags=iptables"
```
