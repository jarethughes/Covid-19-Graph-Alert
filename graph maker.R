#Graph Maker for Covid-19 Graph Alert
#By: Jaret Hughes

#Setup
library(httr)
setwd("C:/Users/Jaret/Documents/GitHub/Covid-19-Graph-Alert")
# name will vary depending on your setup, since this is running on my computer I am using this for now

#Get yesterday's data from John Hopkins CSSE
date = Sys.Date()-1
csvname = format(date, "%m-%d-%Y")
today.data = paste("https://raw.githubusercontent.com/CSSEGISandData/COVID-19/master/csse_covid_19_data/csse_covid_19_daily_reports/", csvname, ".csv", sep="")
rdat = read.csv(today.data)

