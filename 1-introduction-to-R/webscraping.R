# Starting with the first page
url <- "http://www.ipaidabribe.com/reports/paid"
# read html code from website
url.data <- readLines(url)

# parse HTML tree into an R object
library(XML)
doc <- htmlTreeParse(url.data,  useInternalNodes = TRUE)

# extract what we need: descriptions and basic info for each bribe
titles <- xpathSApply(doc, "//div[@class='report_title']", xmlValue)
deparment <- xpathSApply(doc, "//span[@class='report_dept_name']", xmlValue)
amount <- xpathSApply(doc, "//span[@class='amount_field']", xmlValue)
city <- xpathSApply(doc, "//span[@class='hightlight_span']", xmlValue)

# do some cleaning
amounts <- gsub(",", "", amount)
l <- str_extract(city, "\\w* \\d+, \\d+")
date <- l[complete.cases(l)]
city <- city[is.na(str_extract(city, "\\w* \\d+, \\d+"))]


# we can put it together in a matrix
page.data <- cbind(titles, deparment, date, city, amounts)

# let's wrap it in a single function
extract.bribes <- function(url){
  require(stringr)
  cat("url:", url)
  url.data <- readLines(url)
  doc <- htmlTreeParse(url.data,  useInternalNodes = TRUE)
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

## all urls
urls <- paste0("http://www.ipaidabribe.com/reports/paid?page=", 0:50)

## empty array
data <- list()

## looping over urls...
for (i in seq_along(urls)){
  # extracting information
  data[[i]] <- extract.bribes(urls[i])
  # waiting one second between hits
  Sys.sleep(1)
  cat(" done!\n")
}

## transforming it into a data.frame
data <- data.frame(do.call(rbind, data), stringsAsFactors=F)

# quick summary statistics
head(sort(table(data$department),dec=T))
head(sort(table(data$city),dec=T))
summary(as.numeric(data$amounts))
