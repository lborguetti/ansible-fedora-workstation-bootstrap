localhost
---

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

- { role: packages, tags: packages }

- { role: bash, tags: bash }

- { role: tmux, tags: tmux }

- { role: neovim, tags: neovim }

- { role: docker, tags: docker }

- { role: golang, tags: golang }

- { role: git, tags: git }

- { role: dropbox, tags: dropbox }

- { role: skype, tags: skype }

- { role: zoom, tags: zoom }
