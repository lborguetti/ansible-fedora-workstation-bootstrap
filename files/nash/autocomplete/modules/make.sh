#!/usr/bin/env nash

#
# auto complete for Makefile targets
#

# The `parts` argument hold the line splited by space.
fn make_complete(parts, line, pos) {
	var choice = ""
	var choices = ""
	var ret = ()
	var status = ""

	_, status <= stat "Makefile" >[2=]

	if $status != "0" {
		return $ret
	}

	choices <= awk "/.[^.PHONY:]: \$/{ print $1 }" "Makefile" | tr ":" " "
	choice  <= (
		echo $choices |
		-fzf --header "Makefile targets: "
						--reverse
						 |
		tr -d "\n"
	)

	if $status != "0" {
		return $ret
	}

	ret = ($choice "0")

	return $ret
}
