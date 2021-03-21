#!/bin/bash
# Diff the mocha from node_modules with the mocha here.
if which vdiff.sh; then
	if [ -z "$1" ]; then
		DIFF=vdiff.sh
	else
		# diffmocha.sh --reverse
		DIFF=rvdiff.sh
	fi
else
	DIFF=$VDIFF
fi

$DIFF ./node_modules/mocha/mocha.css mocha.css
$DIFF ./node_modules/mocha/mocha.js mocha.js
$DIFF ./node_modules/mocha/package.json package.json
