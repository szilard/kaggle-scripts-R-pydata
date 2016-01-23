
Kaggle scripts: R vs pydata + most popular R and Python packages for Machine Learning
=============================================================

Kaggle scripts are a way Kaggle users can share their code. By analyzing these scripts
as data I hope to get some insights in what tools (R and Python packages) are the most popular
(for machine learning).


## Tools for Machine Learning

There are various surveys on tools used for data analysis / data science / data mining and even just
machine learning. Most notably 
the [KDnuggets surveys](http://www.kdnuggets.com/polls/2015/analytics-data-mining-data-science-software-used.html),
the [Rexer Analytics surveys](http://www.rexeranalytics.com/Data-Miner-Survey-Results-2013.html) and
the [O'Reilly Radar surveys](http://radar.oreilly.com/2015/09/2015-data-science-salary-survey.html).
I have also done myself some surveys at various meetups in Los Angeles e.g. 
[tools for data science](http://datascience.la/data-science-toolbox-survey-results-surprise-r-and-python-win/)
(that is for data munging, data visualization and modeling/machine learning) and
[tools for machine learning](https://github.com/szilard/survey-ml-tools) (just for the machine learning part). 

In all these surveys R and Python are at the top in usage (and absolutely dominate at meetups, which are frequented 
by people using mostly open source tools). R has perhaps some edge when considering the entire data analysis
workflow, and maybe Python has a slight advantage when considering only the machine learning part.
Of course, all these surveys have biases etc. and one should take the results with caveats.

There are countless blog posts about R vs Python for data science (based on features, usage etc.), 
some of them giving the impression of a war.
I do not intend to add to the flames, I just looked at some usage data and show the results. The results seem
to align well with the surveys in the sense that there is no clear winner in popularity.


## R vs Python (and vs Julia) in Kaggle scripts

There are a lot of proxies/approximations/possible biases here. The usually caveats apply.

You can download a list a Kaggle scripts from https://www.kaggle.com/scripts. You can choose a language
e.g. R/Python and choose to sort by votes, e.g. https://www.kaggle.com/scripts?sortBy=votes&language=R.
You will get only a few top scripts, but you can scroll for more. I'm getting only those with `votes > 0`
and saving the results for each language (manually) as an HTML file. You could automate this if you want.

I've got files for R, R-markdown, Python and Julia. I've combined R and R-markdown in one group. I've
[calculated](1-RvsPy-table.sh) the total number of scripts, votes and views by language:

       |  scripts |  votes   |  views
-------|----------|----------|----------
Julia  |    30    |    50    |    11059
Python |    945   |   4558   |  1095967
R+Rmd  |    975   |   5212   |  1223700



## Most popular R/Python packages/libraries

You can get the list of R/Python scripts, download them and look for `library` or `required` (R) 
and `import` (Python) and see which packages are the most popular. Here is a 
[script](2-packages.sh) that does that (please keep `sleep` as in the script to be gentle on Kaggle's
website).


#### Most popular R packages:

```
    344 readr
    246 ggplot2
    141 dplyr
    125 randomForest
    122 data.table
    108 xgboost
    102 caret
     62 lubridate
     51 Metrics
     51 Matrix
     49 plyr
     42 ggmap
     34 h2o
     33 tm
     29 rpart
     22 reshape2
     22 e1071
     21 RSQLite
     20 scales
     20 corrplot
     17 png
     16 geosphere
     16 gbm
     16 Rtsne
     16 RColorBrewer
     15 stringr
     15 rpart.plot
     15 gridExtra
     14 methods
     14 ggvis
     14 Hmisc
     12 rjson
     12 jsonlite
     12 car
     11 zoo
     11 sqldf
     11 party
     11 doMC
     11 SnowballC
     11 MASS
     10 tidyr
     10 reshape
     10 forecast
     10 doParallel
     10 caTools
```

of which the most popular R *machine learning* packages are:

```
    125 randomForest
    108 xgboost
    102 caret
     34 h2o
     29 rpart
     22 e1071
     16 gbm
```

xgboost and h2o are not R packages exclusively: xgboost is a C++ library
with R/Python/etc. APIs, h2o is launching a separate Java process that
can be interacted with from R/Python/etc.


#### Most popular Python libraries:

```
    531 numpy
    498 pandas
    447 sklearn
    187 matplotlib
    156 xgboost
     77 re
     68 scipy
     68 os
     64 seaborn
     60 math
     54 nltk
     52 datetime
     47 csv
     43 bs4
     40 zipfile
     34 sys
     32 lasagne
     31 nolearn
     30 time
     29 keras
     28 theano
     27 random
     24 glob
     23 haversine
     19 collections
     18 json
     17 PIL
     15 string
     14 hep_ml
     13 pylab
     13 operator
     13 itertools
     13 gzip
     10 pickle
     10 mne
     10 __future__
      9 warnings
      9 subprocess
      9 sqlite3
      9 joblib
      8 multiprocessing
      8 evaluation
      7 ml_metrics
      7 logging
      7 io
      6 skimage
      6 ances
      6 ance
      5 neon
      5 copy
      5 contextlib
      4 mpl_toolkits
      4 gc
      4 functools
      3 timeit
      3 tensorflow
      3 statsmodels
      3 pprint
      3 pip
      3 patsy
      3 codecs
```

of which the most popular Python *machine learning* libraries:
```
    447 sklearn
    156 xgboost
     54 nltk
     32 lasagne
     31 nolearn
     29 keras
     28 theano
     14 hep_ml
      3 tensorflow
```

xgboost is a C++ library with R/Python/etc. API as already mentioned at the R section. 
nltk is a text processing library with some ML. lasagne, nolearn, keras, theano and 
tensorflow are mainly for deep learning.


## Discussion

...



## Conclusion

How good are these results in describing **popularity of tools among machine learning
practitioners**? There are a lot of approximations/proxies/possible biases here, e.g.
Kaggle users vs machine learning professionals, Kaggle scripts (sharing) vs 
Kaggle users' usage in projects/competitions, small sample etc. etc. But I still think it gives 
a rough idea. You are welcome to submit results 
(as [github issue](https://github.com/szilard/kaggle-scripts-R-pydata/issues))
if you know any better.



## P.S. (Ideas/TODOs etc)

#### R scripts by user:

```
cat url-r.txt | sed 's/.*kaggle.com\///' | sed 's/\/.*//' | sort | uniq -c | sort -nr | head 

     68 benhamner
     17 dchudz
     12 domcastro
      8 users
      8 unbingo
      8 pchitta
      7 sinaasappel
      7 sandipb
      7 mlandry
      7 colinpriest
```

One could eliminate the top 1 or 2 who btw are Kaggle employees.





