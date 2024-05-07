#!/bin/bash

IFILE=/tmp/$RANDOM
OFILE=/tmp/$RANDOM
vim +startinsert $IFILE
sed '/^[[:alnum:]]/ s/./# &/' $IFILE | \
   sed 's/    [[:alnum:]]/-&/' | \
      sed 's/    /  /g' | \
         sed 's/-  /- /g' | \
            sed 's/ \(.*\) <h\(.*\)>/ \[\1\|h\2\]/g' | \
               head --lines=-1 > $OFILE

cat $OFILE

read
