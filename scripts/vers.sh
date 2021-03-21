#!/bin/bash
echo VERSION NUMBERS:
echo "   npm published: `npm view $NPMPKG version`"
echo "   local: `packagever.sh`"
egrep 'version.+[0-9]' $VERFILES \
| perl -pne '$_ = qq{   $_}'
