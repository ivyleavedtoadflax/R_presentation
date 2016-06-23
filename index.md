---
title       : A (very) brief introduction to R
subtitle    : June 21 2016
author      : Matthew Upson PhD
credit      : Arthur Lugtigheid PhD
job         : Data Scientist (ESEDD)
framework   : io2012        # {io2012, html5slides, shower, dzslides, ...}
highlighter : highlight.js  # {highlight.js, prettify, highlight}
hitheme     : tomorrow      # 
widgets     : []            # {mathjax, quiz, bootstrap}
mode        : selfcontained # {standalone, draft}
knit        : slidify::knit2slides
---

<style>

em {
  font-style: italic;
}

strong {
  font-weight: bold;
}

</style>

## Before we start...

* I can't teach you much in an hour...

* This session focusses on:
  * Some high level advice you might not hear elsewhere.
  * A very simple walthrough
  * Some advice for the future and where to get help

---

## Why R?

* R is free (["free" as in "free speech", not as in "free beer"](https://en.wikipedia.org/wiki/Gratis_versus_libre#.22Free_beer.22_vs_.22free_speech.22_distinction)).
* Growing popularity (part of SQL server 2016).
* Can talk to Hadoop and Spark (two very popular 'big data' technologies).
* Supported by an enormous and active community.


```r
# CRAN 'vetted' package
install.packages("dplyr")
library(dplyr)

# Packages on github
devtools::install_github("ivyleavedtoadflax/govstyle")
# or in DfE: download the zip
devtools::install_local("C://govstyle-master.zip")
```

--- .intermezzo

## Getting started on a project

(Some important things you may have never thought about)

* Setting up
* Dependency control
* Making it clear and reproducible

---

## Setting up a project

* Use RStudio projects instead.
  * Avoids use of `setwd()` - required for advanced functionality.
  * File > New Project...
  
  <img src="assets/img/rstudio_project.png" style="display: block; margin-left: auto; margin-right: auto; border-width: 1px; border-colour: #000000;border-style: solid;">

---

## Dependency control

* R is constantly under development (as are packages).
* Changes to packages __can__ break your code.
* __Avoid dependency hell__ with a little planning.

The simplest way: record system info for each project.


```r
.libPaths()
```

```
## [1] "/home/matthew/R/x86_64-pc-linux-gnu-library/3.3"
## [2] "/usr/local/lib/R/site-library"                  
## [3] "/usr/lib/R/site-library"                        
## [4] "/usr/lib/R/library"
```

---

## Dependency control


```r
# Which exact packages are used?
sessionInfo()
```

```
## R version 3.3.0 (2016-05-03)
## Platform: x86_64-pc-linux-gnu (64-bit)
## Running under: Ubuntu 14.04.4 LTS
## 
## locale:
##  [1] LC_CTYPE=en_GB.UTF-8       LC_NUMERIC=C              
##  [3] LC_TIME=en_GB.UTF-8        LC_COLLATE=en_GB.UTF-8    
##  [5] LC_MONETARY=en_GB.UTF-8    LC_MESSAGES=en_GB.UTF-8   
##  [7] LC_PAPER=en_GB.UTF-8       LC_NAME=C                 
##  [9] LC_ADDRESS=C               LC_TELEPHONE=C            
## [11] LC_MEASUREMENT=en_GB.UTF-8 LC_IDENTIFICATION=C       
## 
## attached base packages:
## [1] stats     graphics  grDevices utils     datasets  methods   base     
## 
## other attached packages:
## [1] dplyr_0.4.3
## 
## loaded via a namespace (and not attached):
##  [1] Rcpp_0.12.5      codetools_0.2-14 digest_0.6.9     assertthat_0.1  
##  [5] R6_2.1.2         DBI_0.4-1        formatR_1.4      magrittr_1.5    
##  [9] evaluate_0.9     stringi_1.1.1    whisker_0.3-2    tools_3.3.0     
## [13] stringr_1.0.0    markdown_0.7.7   yaml_2.1.13      parallel_3.3.0  
## [17] slidify_0.5      knitr_1.13.1
```

---

## Dependency control

A better system for handling dependencies (in most cases).


```r
# Install and load the checkpoint library

install.packages("checkpoint")
library(checkpoint)

# Set a checkpoint for the project

checkpoint("2016-05-22", use.knitr = TRUE)

# Subsequently, you can load this snapshot with:

setSnapshot("2016-05-22")
```

Some packages will need to be installed manually. Watch your disk space!

---

## Reproducibility and Clarity

**The Past is a foreign country, they do things differently there**

* Code is for People (Not Computers).


```r
hard_to_read <- function(x) ifelse(x == 0, NA, x)
```

* Make things readable
* `# Comment liberally`


```r
# Function to replace zero values with NA

slightly_better <- function(x) {
  
  ifelse(x == 0, NA, x)
  
}
```

---

## Reproducibility and Clarity

* Be explicit (at least to begin with).


```r
# Function to replace zero values with NA

best <- function(x) {
  
  ifelse(
    test = (x == 0), 
    yes = NA, 
    no = x)
  
}
```

---

## Reproducibility and Clarity

* Reproducible formats:
  * Combine code with narrative in one document.
  * Able to handle increasingly complex documents.
  * Output to html, word, pdf (maybe).

--- .intermezzo

## Walking through a project

* The RStudio environment
* Getting the data in
* Manipulating data
* Producing an output

---

## The RStudio environment

<img src="assets/img/Rstudio.png" style="display: block; height: 550px;">

---

## The RStudio environment


```r
# Assign an object to the name foo

foo <- rnorm(100)

# See which objects are in my environment

ls()
```

```
## [1] "encoding"  "foo"       "inputFile"
```

* Beware masking other functions.
* `filter()` exists in package **stats** (loaded by default) and **dplyr** which you must load manually.
* Use `dplyr::filter()` to explicitly call the one of interest.

--- .intermezzo

## The long view

* Functional programming
* Testing your code
* Writing packages

--- 

## Functional programming

__D__o not __R__epeat __Y__ourself 


---

## Testing

---

## RStudio


--- .intermezzo

## Working with objects and functions

* assignment
* data types
* the workspace
* functions and arguments

---

## Assignment 

Everything in R is an object


--- .intermezzo

## Loading data and getting libraries

* loading data
* libraries

--- .intermezzo

## Rstudio Projects and getting help

* Rstudio projects
* Getting help in R

--- 

### Base R console



---

### RStudio

<img src="assets/img/r_studio.png" style="display: block; height: 550px;">

---

## Installing and using packages

One of the strengths of R is that there are literally thousands of packages available for you to extend the core capabilities of the R statistical environment. 


```r
# This installs the wordcloud package from CRAN
install.packages('wordcloud')
```

Then to use the package, you have to load it through the library command:


```r
library(wordcloud)

wordcloud(
  panama,            # this is data I mined from the common's hansard records
  scale=c(5,0.5), 
  max.words=100, 
  random.order=FALSE, 
  rot.per=0.35, 
  use.r.layout=FALSE, 
  colors=brewer.pal(8, 'Dark2')
  )
```

---

## Installing and using packages *(Cont.)*

And here are the 100 most used words in the House of Commons debate on the Panama papers (Mon 14 April 2016) represented as a word cloud:

<img src="assets/img/wordcloud.png" height="420">

---

## Getting help

Every function has a help function with syntax and examples:

<div style="border: 1px solid #ccc; width: 100%; backgorund-color: #fff; padding: 10px 0;">
  <img src="assets/img/help.jpg" style="display: block; margin-left: auto; margin-right: auto;" />
</div>

---

## Helping yourself

There is a plethora of general help books available:
<br />
<div style="display: block; margin-left: auto; margin-right: auto">
<img src="assets/img/copy-paste.jpg" height="420">
<img src="assets/img/trying.jpg" height="420">
</div>

---

## Helping yourself

If that doesn't work:
<br />

<div style="display: block; margin-left: auto; margin-right: auto">
<img src="assets/img/google.jpg" height="420">
</div>

--- .intermezzo

## Best practice for using R and Rstudio

* Commenting and clarity
* Rstudio
* Keep it reproducible
* Avoiding dependency hell
* Version control

