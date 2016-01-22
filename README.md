
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


## Most popular R/Python packages/modules

You can get the list of R/Python scripts, download them and look for `library` or `required` (R) 
and `import` (Python) and see which packages are the most popular. Here is a 
[script](2-packages.sh) that does that (please keep `sleep` as in the script to be gentle on Kaggle's
website).

Here are the most popular R packages:

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

TODO: Python most popular modules


## Discussion

How good are these results in describing popularity of tools among machine learning
practitioners? There are a lot of approximations/proxies/possible biases here, e.g.
Kaggle users vs machine learning professionals, Kaggle scripts (sharing) vs 
Kaggle usage in competitions, small sample etc. etc. But I still think it gives 
a rough idea. You are welcome to submit results if you have any better.


