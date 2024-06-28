#!/bin/bash

IFILE=/tmp/$RANDOM
OFILE=/tmp/$RANDOM
vim +startinsert $IFILE
sed 's/    /*/g' $IFILE | \
   sed 's/^[\*][\*]*/& /g' | \
      sed 's/^[^\*]*$/\nh2. &\n/g' | \
         sed 's/ \(.*\) <h\(.*\)>/ \[\1\|h\2\]/g' | \
            head --lines=-1 > $OFILE

cat $OFILE

read
