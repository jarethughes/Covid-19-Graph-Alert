#Graph Maker for Covid-19 Graph Alert
#By: Jaret Hughes

#Setup
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
  date = read.csv(today.data)
  return(date)
}

for (i in first.file:yesterday) {
  i.date = as.Date(i, origin = "1970-01-01")
  assign(paste("data-",i.date,sep=""),importCSV(i.date))
}

#Clean data

#Summary

#Graph Making
