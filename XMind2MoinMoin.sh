#!/bin/bash

IFILE=/tmp/$RANDOM
OFILE=/tmp/$RANDOM
vim +startinsert $IFILE
sed 's/\t/ /g' $IFILE | sed 's/^[ ][ ]*/&* /g' | sed 's/^[^\*]*$/=== & ===/g' > $OFILE
cat $OFILE
read
