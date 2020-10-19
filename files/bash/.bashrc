# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
    . /etc/bashrc
fi

# Prompt
test -e ${HOME}/.local/share/git/git-prompt.sh && status=0
if [ "x${status}" != "x0" ] ; then
  curl --create-dirs -o ${HOME}/.local/share/git/git-prompt.sh \
    https://raw.githubusercontent.com/git/git/master/contrib/completion/git-prompt.sh
fi
source ${HOME}/.local/share/git/git-prompt.sh
export PS1='┌─[\[\e[38;5;32m\]\w\[\e[0m\]\[\e[38;5;240m\]$(__git_ps1 " (%s)")\[\e[0m\]]\n└─╼ '

# Uncomment the following line if you don't like systemctl's auto-paging feature:
export SYSTEMD_PAGER=

# GO
export GOPATH="${HOME}/Projects/go-workspace"

# NASH
NASHROOT="${HOME}/nashroot"
NASHPATH="${HOME}/nash"
export NASHROOT
export NASHPATH
export PATH="$PATH:$NASHROOT/bin"

# vpn
alias vpn="sudo openvpn --cd $HOME/.config/openvpn --config rohan.ovpn"

# myip
alias myip='curl ifconfig.co'

# encfs
alias encfs_mount="ENCFS6_CONFIG=$HOME/.config/encfs6.xml encfs $HOME/Dropbox/Work $HOME/Private"

# nvim
alias vim="nvim"

# nvim /etc/hosts
alias h="sudo nvim /etc/hosts"

# pbcopy/pbpaste
alias pbcopy='xsel --clipboard --input'
alias pbpaste='xsel --clipboard --output'

# load virtualenv
alias venv='v=".venv/bin/activate"; if [ -e ${v} ]; then source ${v} ]; else echo "virtualenv not found in current dir"; fi'

# system update/upgrade
alias dnf-update="sudo dnf update"

# st
alias st='st -f "Monospace-12"'

# chcon docker
alias chcondocker='chcon -R -t svirt_sandbox_file_t'
