# vpn
fn vpn() {
	sudo openvpn --cd $HOME+"/.config/openvpn" --config rohan.ovpn
}

bindfn vpn vpn

# myip
fn myip() {
	dig \+short www.google.com @8.8.8.8
}

# encfs
fn encfs_mount() {
	encfs $HOME+"/Dropbox/Work" $HOME+"/Private"
}

bindfn encfs_mount encfs_mount

# vim /etc/hosts
fn h() {
	sudo nvim /etc/hosts
}

bindfn h h

# pbcopy + pbpaste
fn pbcopy() {
	xsel --clipboard --input
}

bindfn pbcopy pbcopy

fn pbpaste() {
	xsel --clipboard --output
}

bindfn pbpaste pbpaste

fn weather() {
	curl -4 https://wttr.in/Florianopolis?2
}

bindfn weather weather
