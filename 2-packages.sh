#!/bin/bash

cat r+rmd.html  | grep 'scriptUrl' | egrep -v 'text-decoration|discussion' | sed 's/.*href="\([^"]*\)".*/\1/' > url-r.txt
cat python.html | grep 'scriptUrl' | egrep -v 'text-decoration|discussion' | sed 's/.*href="\([^"]*\)".*/\1/' > url-py.txt

for LANG in r py; do
for URL in $(cat url-$LANG.txt); do
  FILE=$(echo $URL | sed 's/.*kaggle.com\/\(.*\)/\1/' | sed 's/\//---/g')
  curl -k -o "scripts-$LANG/$FILE" "$URL"
  sleep 3
done
cat scripts-$LANG/* > scripts-all-$LANG.html
done

cat scripts-all-r.html | grep Kaggle.Mapping.fromJS | grep '"text"' | sed 's/\\n/\'$'\n/g' | \
  egrep 'library\(|require\(' | sed 's/require/library/' | sed 's/\\u002[27]//g' | \
  sed 's/.*library(\([^)]*\)).*/\1/' | sort | uniq -c | sort -nr

## TODO: Python
