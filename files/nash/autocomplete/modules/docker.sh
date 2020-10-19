#!/usr/bin/env nash

#
# auto complete for docker commands
#

fn docker_complete(parts, line, pos) {
	var choice = ""
	var docker_cmds = "attach build commit cp create diff events exec export history images import info inspect kill load login logout logs pause port ps pull push rename restart rm rmi run save search start stats stop tag top unpause update version wait"
	var ret = ()
	var status = ""

	var partsz <= len($parts)

	if $partsz != "2" {
		return $ret
	}

	choice, status <= (
		echo $docker_cmds |
		tr " " "\n" |
		fzf --header "Docker commands: "
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
