#!/bin/bash

## get URLs for R/py scripts
cat r+rmd.html  | grep 'scriptUrl' | egrep -v 'text-decoration|discussion' | sed 's/.*href="\([^"]*\)".*/\1/' > url-r.txt
cat python.html | grep 'scriptUrl' | egrep -v 'text-decoration|discussion' | sed 's/.*href="\([^"]*\)".*/\1/' > url-py.txt


## download R+py scripts
for LANG in r py; do
for URL in $(cat url-$LANG.txt); do
  FILE=$(echo $URL | sed 's/.*kaggle.com\/\(.*\)/\1/' | sed 's/\//---/g')
  curl -k -o "scripts-$LANG/$FILE" "$URL"
  sleep 3
done
cat scripts-$LANG/* > scripts-all-$LANG.html
done


## most popular R packages
cat scripts-all-r.html | grep Kaggle.Mapping.fromJS | grep '"text"' | sed 's/\\n/\'$'\n/g' | \
  egrep 'library\(|require\(' | sed 's/require/library/' | sed 's/\\u002[27]//g' | \
  sed 's/.*library(\([^)]*\)).*/\1/' | sort | uniq -c | sort -nr


## most popular Python modules
TMPFILE=$(tempfile)
for FILE in $(ls -1 scripts-py/); do
  cat scripts-py/$FILE |  grep Kaggle.Mapping.fromJS | grep '"text"' | \
     sed 's/\\n/\'$'\n/g' | egrep 'import' | egrep '^(from|import)' | \
     sed 's/^import *\([^ ]*\).*/\1/' | sed 's/^from *\([^ ]*\).*/\1/' | sed 's/\([^.]*\).*/\1/' | \
     sed 's/[\;,].*//' | sort | uniq >> $TMPFILE
done
cat $TMPFILE | sort | uniq -c | sort -nr
rm $TMPFILE


