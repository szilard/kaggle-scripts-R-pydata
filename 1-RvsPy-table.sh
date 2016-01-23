#!/bin/bash

## get MANUALLY r,rmd,python,julia list of scripts with votes>0

cat r.html rmd.html > r+rmd.html

for FILE in $(ls -1 *html); do
  echo $FILE
  echo -n "scripts:"
  grep totalVotes $FILE | wc -l
  echo -n "votes:"
  grep totalVotes $FILE | sed 's/.*totalVotes">//' | sed 's/<\/span.*//' | paste -sd+ - | bc
  echo -n "views:"
  grep totalViews $FILE | sed 's/.*totalViews">//' | sed 's/<\/span.*//' | paste -sd+ - | bc
done


