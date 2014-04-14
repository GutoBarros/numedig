---
title       : Introduction to R programming 
subtitle    : NUMEDIG, September 2013.
---

<style>
em {
  font-style: italic
}
strong {
  font-weight: bold;
}
p.red {
  color: red;
}
</style>

## We have to get through this...

* `R` is a flavor of the `S` language for statistical computing
* `S` was developed by John Chambers at Bell Labs in the late 1970s
* Version 4 of `S`, the latest version, was finished in 1998
* In 1991, Ross Ihaka and Robert Gentleman create `R`
* `R` is named for their first initials

--- .fadedbullets

## Agenda

> 1. Creating a reproducible workflow that integrates analysis, code and results
> 2. Webscraping
> 3. Interactive documents

<script>
  $('slide.fadedbullets ol.build').addClass('fade')
</script>


--- .nobackground .segue bg:indigo

## 1. Reproducible research

--- 
  
## Why?
  
* Automatically regenerate documents when code, data, or assumptions change,
* Makes authoring easier and more productive,
* Easier to replicate results,
* Enables a <span class = 'red'>split-apply-combine</span> strategy
  * Go from `.Rnw` to `.tex`,
  * or from `.Rmd` with a quick stop at `.md` all the way to `.html`.

---


<iframe src='assets/img/knit.svg' width=800px height=250px></iframe> 


---


<iframe src='assets/img/split_apply_combine.svg' width=800px height=250px></iframe> 


---


<iframe src='assets/img/split.svg' width=800px height=250px></iframe> 


---


<iframe src='assets/img/apply.svg' width=800px height=250px></iframe> 


---


<iframe src='assets/img/combine.svg' width=800px height=250px></iframe> 


--- .nobackground .segue bg:black


## Example: from `.Rnw` to `.tex`


--- .nobackground .segue bg:indigo


## 2. Webscraping


---
  
## Why?
* Increasing amount of data available on the web
  * Election results, legislative speeches
  * Social media data (Twitter, Facebook, etc.)
  * Geographic information, sports scores, etc.
* These data are almost always in funny formats
  * So we want a structered and reliable approach to turn it into a usable dataset.
* Web scraping is the process of extracting this information automatically and transform it into a structured dataset.
* (we only have time for a quick example)

---


<iframe src = 'http://www.ipaidabribe.com/reports/paid' height='400px'></iframe>


---
  
## Bribes in India
  
* Crowdsourcing to combat corruption,
* Data on 18,000 bribes paid in India, self-reported,
* Information about amount, location, and why bribe was paid,
* We will
  * Parse semi-structured `HTML` code
  * Find 'node' of interest and extract it,
  * Clean data,
  * Prepare script to extract data recursively.

--- .smaller


```r
# Starting with the first page
url <- "http://www.ipaidabribe.com/reports/paid"
# read html code from website
url.data <- readLines(url)

# parse HTML tree into an R object
library(XML)
doc <- htmlTreeParse(url.data, useInternalNodes = TRUE)

# extract what we need: descriptions and basic info for each bribe
titles <- xpathSApply(doc, "//div[@class='report_title']", xmlValue)
deparment <- xpathSApply(doc, "//span[@class='report_dept_name']", xmlValue)
amount <- xpathSApply(doc, "//span[@class='amount_field']", xmlValue)
city <- xpathSApply(doc, "//span[@class='hightlight_span']", xmlValue)
```


--- .smaller


```r
require(stringr)
amounts <- gsub(",", "", amount)
l <- str_extract(city, "\\w* \\d+, \\d+")
date <- l[complete.cases(l)]
city <- city[is.na(str_extract(city, "\\w* \\d+, \\d+"))]

# we can put it together in a matrix
page.data <- cbind(titles, deparment, date, city, amounts)
```


--- .smaller


```r
# let's wrap it in a single function
extract.bribes <- function(url) {
    require(stringr)
    cat("url:", url)
    url.data <- readLines(url)
    doc <- htmlTreeParse(url.data, useInternalNodes = TRUE)
    titles <- xpathSApply(doc, "//div[@class='report_title']", xmlValue)
    department <- xpathSApply(doc, "//span[@class='report_dept_name']", xmlValue)
    amount <- xpathSApply(doc, "//span[@class='amount_field']", xmlValue)
    city <- xpathSApply(doc, "//span[@class='hightlight_span']", xmlValue)
    amounts <- gsub(",", "", amount)
    l <- str_extract(city, "\\w* \\d+, \\d+")
    date <- l[complete.cases(l)]
    city <- city[is.na(str_extract(city, "\\w* \\d+, \\d+"))]
    return(cbind(titles, department, date, city, amounts))
}
```


--- .smaller


```r
## all urls
urls <- paste0("http://www.ipaidabribe.com/reports/paid?page=", 0:25)

## empty array
data <- list()

## looping over urls...
for (i in seq_along(urls)) {
    # extracting information
    data[[i]] <- extract.bribes(urls[i])
    # waiting one second between hits
    Sys.sleep(1)
    cat(" done!\n")
}
```

```
## url: http://www.ipaidabribe.com/reports/paid?page=0 done!
## url: http://www.ipaidabribe.com/reports/paid?page=1 done!
## url: http://www.ipaidabribe.com/reports/paid?page=2 done!
## url: http://www.ipaidabribe.com/reports/paid?page=3 done!
## url: http://www.ipaidabribe.com/reports/paid?page=4 done!
## url: http://www.ipaidabribe.com/reports/paid?page=5 done!
## url: http://www.ipaidabribe.com/reports/paid?page=6 done!
## url: http://www.ipaidabribe.com/reports/paid?page=7 done!
## url: http://www.ipaidabribe.com/reports/paid?page=8 done!
## url: http://www.ipaidabribe.com/reports/paid?page=9 done!
## url: http://www.ipaidabribe.com/reports/paid?page=10 done!
## url: http://www.ipaidabribe.com/reports/paid?page=11 done!
## url: http://www.ipaidabribe.com/reports/paid?page=12 done!
## url: http://www.ipaidabribe.com/reports/paid?page=13 done!
## url: http://www.ipaidabribe.com/reports/paid?page=14 done!
## url: http://www.ipaidabribe.com/reports/paid?page=15 done!
## url: http://www.ipaidabribe.com/reports/paid?page=16 done!
## url: http://www.ipaidabribe.com/reports/paid?page=17 done!
## url: http://www.ipaidabribe.com/reports/paid?page=18 done!
## url: http://www.ipaidabribe.com/reports/paid?page=19 done!
## url: http://www.ipaidabribe.com/reports/paid?page=20 done!
## url: http://www.ipaidabribe.com/reports/paid?page=21 done!
## url: http://www.ipaidabribe.com/reports/paid?page=22 done!
## url: http://www.ipaidabribe.com/reports/paid?page=23 done!
## url: http://www.ipaidabribe.com/reports/paid?page=24 done!
## url: http://www.ipaidabribe.com/reports/paid?page=25 done!
```

```r

## transforming it into a data.frame
data <- data.frame(do.call(rbind, data), stringsAsFactors = F)
```


--- .smaller


```r
# quick summary statistics
head(sort(table(data$department), dec = T))
```

```
## 
##                  Police                Passport               Transport 
##                      87                      28                      23 
## Stamps and Registration      Municipal Services                Airports 
##                      21                      15                      14
```

```r
head(sort(table(data$city), dec = T))
```

```
## 
##      Bangalore, Karnataka       Mumbai, Maharashtra 
##                        48                        20 
##          New Delhi, Delhi Hyderabad, Andhra Pradesh 
##                        19                        14 
##         Pune, Maharashtra       Chennai, Tamil Nadu 
##                        12                        11
```


--- .smaller


```r
# quick summary statistics
data[1:4, 1]
```

```
## [1] "Background Verification for VISA" "Bribe for Passport"              
## [3] "Commercial Tax"                   "Inappropriate use of traffic law"
```

```r
data[1:4, 2:5]
```

```
##                       department            date
## 1                         Police August 30, 2013
## 2          Bureau of Immigration August 30, 2013
## 3 Commercial Tax, Sales Tax, VAT August 30, 2013
## 4                         Police August 30, 2013
##                           city  amounts
## 1         Bangalore, Karnataka      300
## 2 Narasaraopet, Andhra Pradesh 15000000
## 3       Indore, Madhya Pradesh      500
## 4       Coimbatore, Tamil Nadu      100
```

```r
summary(as.numeric(data$amounts))
```

```
##     Min.  1st Qu.   Median     Mean  3rd Qu.     Max. 
##        0      300      800   166000     5000 20000000
```


--- .nobackground .segue bg:indigo

## 3. Interactive documents


---
## Interactive chart code

```r
require(rCharts)
haireye = as.data.frame(HairEyeColor)
n1 <- nPlot(Freq ~ Hair, group = "Eye", type = "multiBarChart", data = subset(haireye, 
    Sex == "Male"))
n1$print("chart1")
```


--- .smaller

## Result

<div id='chart1' class='rChart nvd3'></div>
<script type='text/javascript'>
 $(document).ready(function(){
      drawchart1()
    });
    function drawchart1(){  
      var opts = {
 "dom": "chart1",
"width":    800,
"height":    400,
"x": "Hair",
"y": "Freq",
"group": "Eye",
"type": "multiBarChart",
"id": "chart1" 
},
        data = [
 {
 "Hair": "Black",
"Eye": "Brown",
"Sex": "Male",
"Freq":     32 
},
{
 "Hair": "Brown",
"Eye": "Brown",
"Sex": "Male",
"Freq":     53 
},
{
 "Hair": "Red",
"Eye": "Brown",
"Sex": "Male",
"Freq":     10 
},
{
 "Hair": "Blond",
"Eye": "Brown",
"Sex": "Male",
"Freq":      3 
},
{
 "Hair": "Black",
"Eye": "Blue",
"Sex": "Male",
"Freq":     11 
},
{
 "Hair": "Brown",
"Eye": "Blue",
"Sex": "Male",
"Freq":     50 
},
{
 "Hair": "Red",
"Eye": "Blue",
"Sex": "Male",
"Freq":     10 
},
{
 "Hair": "Blond",
"Eye": "Blue",
"Sex": "Male",
"Freq":     30 
},
{
 "Hair": "Black",
"Eye": "Hazel",
"Sex": "Male",
"Freq":     10 
},
{
 "Hair": "Brown",
"Eye": "Hazel",
"Sex": "Male",
"Freq":     25 
},
{
 "Hair": "Red",
"Eye": "Hazel",
"Sex": "Male",
"Freq":      7 
},
{
 "Hair": "Blond",
"Eye": "Hazel",
"Sex": "Male",
"Freq":      5 
},
{
 "Hair": "Black",
"Eye": "Green",
"Sex": "Male",
"Freq":      3 
},
{
 "Hair": "Brown",
"Eye": "Green",
"Sex": "Male",
"Freq":     15 
},
{
 "Hair": "Red",
"Eye": "Green",
"Sex": "Male",
"Freq":      7 
},
{
 "Hair": "Blond",
"Eye": "Green",
"Sex": "Male",
"Freq":      8 
} 
]
  
      var data = d3.nest()
        .key(function(d){
          return opts.group === undefined ? 'main' : d[opts.group]
        })
        .entries(data)
      
      nv.addGraph(function() {
        var chart = nv.models[opts.type]()
          .x(function(d) { return d[opts.x] })
          .y(function(d) { return d[opts.y] })
          .width(opts.width)
          .height(opts.height)
         
        
          
        

        
        
        
      
       d3.select("#" + opts.id)
        .append('svg')
        .datum(data)
        .transition().duration(500)
        .call(chart);

       nv.utils.windowResize(chart.update);
       return chart;
      });
    };
</script>


--- &vcenter
  
## Non-academic


[Example 1](http://glimmer.rstudio.com/ramnathv/NYCBikeShare/)


--- &vcenter
  
## More academic


[Example 2](http://glimmer.rstudio.com/ramnathv/rChartsRogoff/)
  

---

## Remarks
  
> * In a first-best world results should be presented in an interactive environment
> * Interactive documents let us interact more with the real world
> * _Plus, it's great fun!_

---

## Want to learn more?
- Why not come to the first Copenhagen`R` session? come talk to me!
- First lecture given by a true expert: Peter Dalgaard.

## References 
- Thanks to [Pablo Barbera](http://pablobarbera.com/) for the webscraping example.
- Thanks to [Ramnath Vaidyanathan](https://twitter.com/ramnath_vaidya) for the `slidify` and `rCharts` packages.
- Thanks to [Yihui Xie](https://twitter.com/xieyihui) for the `knitr` package.




