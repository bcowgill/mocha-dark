#!/bin/bash
# Do not run directly, npm will invoke this script at the right time.
# version script After package version updated, copy it to other files, update release note, build everything, add to git, commit, tag and push.
# https://docs.npmjs.com/cli/v7/commands/npm-version

CMD=version.sh
NPM=pnpm
GNPM=npm
TAR=$TARPKG-*.tgz

# terminate on first error
set -e

# turn on trace of currently running command if you need it
#set -x

if [ -z "$VMETHOD" ]; then
	echo NOT OK VMETHOD is not defined, please use bump.sh to begin a version release.
	exit 60
fi

if [ -z "$VMESSAGE" ]; then
	echo NOT OK VMESSAGE is not defined, please use bump.sh to begin a version release.
	exit 61
fi

export REL_VER=`packagever.sh`
if [ -z "$REL_VER" ]; then
	echo NOT OK getting version number
	exit 62
fi
echo ok version $REL_VER

echo ""
echo Step 1: adding release note to README.md.
echo "* $REL_VER $VMETHOD $VMESSAGE" >> README.md
$EDITOR README.md

if grep "\* $REL_VER" README.md ; then
	echo ok README.md
else
	echo NOT OK - README.md does not contain a release note
	exit 63
fi

echo ""
echo Step 2: update source files with new version number.
update-version.sh "$REL_VER" || exit 64
rm *.bak || echo "no backup files to remove."

echo ""
echo Step 3: Pack the npm module and show it to check there are no extra files included.
$NPM pack && tar tvzf $TAR

echo If there are files in the package which should not be you need to add them to the .npmignore file, press Ctrl-C
read prompt

echo Step 4: Test the extracted npm module locally to see if it works.
tar xvzf $TAR
grep version package/*.* | grep $REL_VER
#./perl/js-test.js ../package/ $REL_VER | grep $PROJ
rm -rf $TAR ./package

echo ""
echo Step 5: Add, commit, tag, push. What npm would normally do after running version script:
git add $VERFILES package.json
git commit -m "release Version $REL_VER $VMESSAGE"
tag-version.sh $REL_VER "release Version $REL_VER $VMESSAGE"
