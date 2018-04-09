localhost
---

![](https://raw.githubusercontent.com/lborguetti/localhost/master/assets/localhost-127.0.0.1.jpg)

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

- { role: system-update, tags: system-update }
- { role: packages, tags: packages }
- { role: iptables, tags: iptables }
- { role: bash, tags: bash }
- { role: tmux, tags: tmux }
- { role: neovim, tags: neovim }
- { role: docker, tags: docker }
- { role: golang, tags: golang }
- { role: git, tags: git }
- { role: dropbox, tags: dropbox }
- { role: skype, tags: skype }
- { role: zoom, tags: zoom }
- { role: keybase, tags: keybase }
- { role: openh264, tags: openh264 }
- { role: flash-player, tags: flash-player }
- { role: spotify, tags: spotify }
