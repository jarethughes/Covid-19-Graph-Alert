#Graph Maker for Covid-19 Graph Alert
#By: Jaret Hughes

#Setup
args = commandArgs(trailingOnly = TRUE)
library(httr)
setwd("C:/Users/Jaret/Documents/GitHub/Covid-19-Graph-Alert")
#Name will vary depending on your setup, since this is running on my computer I am using this for now

yesterday = Sys.Date()-1
first.file = as.Date("2020-01-22", "%Y-%m-%d")

#Get all prior data from John Hopkins CSSE
#We want up to yesterday's since we are going to run this in the morning, before the newest data has been published
importCSV = function(date){
  newest.csvname = format(date, "%m-%d-%Y")
  today.data = paste("https://raw.githubusercontent.com/CSSEGISandData/COVID-19/master/csse_covid_19_data/csse_covid_19_daily_reports/", newest.csvname, ".csv", sep="")
  date = clean(read.csv(today.data))
  return(date)
}
#This function takes a date object in any format and creates a data.table object of the .csv for that date. It also cleans up the data.

clean = function(dat){
  if(is.null(dat$Active)) {
    return(dat)
  } else {
    clean.dat = subset(dat, Active >= 0)
    return(clean.dat)
  }
}

for (i in first.file:yesterday) {
  i.date = as.Date(i, origin = "1970-01-01")
  name.date = format(i.date, "%Y.%m.%d")
  assign(paste("data.",name.date,sep=""),importCSV(i.date))
}

#Summary

#Graph Making
