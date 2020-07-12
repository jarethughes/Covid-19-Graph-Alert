#Graph Maker for Covid-19 Graph Alert
#By: Jaret Hughes

#Setup
library(httr)
setwd("C:/Users/Jaret/Documents/GitHub/Covid-19-Graph-Alert")
#Name will vary depending on your setup, since this is running on my computer I am using this for now

yesterday = Sys.Date()-1
first.file = as.Date("2020-01-22", "%Y-%m-%d")
days.since.jan22 = yesterday-first.file
rdat = data.frame()

importCSV = function(date){
  csvname = format(date, "%m-%d-%Y")
  today.data = paste("https://raw.githubusercontent.com/CSSEGISandData/COVID-19/master/csse_covid_19_data/csse_covid_19_daily_reports/", csvname, ".csv", sep="")
  rdat = rdat + read.csv(today.data)
  return()
}

for (i in 1:days.since.jan22) {
  importCSV(i)
}

#Get yesterday's data from John Hopkins CSSE
csvname = format(yesterday, "%m-%d-%Y")
today.data = paste("https://raw.githubusercontent.com/CSSEGISandData/COVID-19/master/csse_covid_19_data/csse_covid_19_daily_reports/", csvname, ".csv", sep="")
rdat = read.csv(today.data)

#Clean data
rdat = subset(rdat, Active>=0)
#Will add to this as I find errors in the data. 

#Summary
summary(rdat)

#Graph Making
