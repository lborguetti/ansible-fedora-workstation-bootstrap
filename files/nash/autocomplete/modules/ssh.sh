#!/usr/bin/env nash

#
# auto complete for ~/.ssh/config
#

# The `parts` argument hold the line splited by space.
fn ssh_complete(parts, line, pos) {
	var choice = ""
	var choices = ""
	var ret = ()
	var status = ""

	choices <= awk "$1 == \"Host\" { host = $2; printf \"%s \", host; }" $HOME+"/.ssh/config"
	choice  <= (
		echo $choices |
		tr " " "\n" |
		-fzf --header "SSH hosts: "
					--reverse
					 |
		tr -d "\n"
	)

	if $status != "0" {
		return $ret
	}

	ret = ($choice+" " "0")

	return $ret
}
