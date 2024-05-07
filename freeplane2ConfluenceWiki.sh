#!/bin/bash

IFILE=/tmp/$RANDOM
OFILE=/tmp/$RANDOM
vim +startinsert $IFILE
sed 's/    /*/g' $IFILE | \
   sed 's/\]/\\\]/g' | \
      sed 's/^[\*]*/& /g' | \
         sed 's/^[^\*]*$/\nh1.&/g' | \
            sed 's/<[#\.\/].*>//g' | \
               sed 's/ \(.*\) <h\(.*\)>/ \[\1\|h\2\]/g' | \
                  head --lines=-1 > $OFILE
echo "\\\\"
echo "----"
cat $OFILE
echo "\\\\"
echo "----"
read
