#Graph Maker for Covid-19 Graph Alert
#By: Jaret Hughes

#Setup
args = commandArgs(trailingOnly = TRUE)
#Blank, for now
library(httr)
setwd("C:/Users/Jaret/Documents/GitHub/Covid-19-Graph-Alert")
#Name will vary depending on your setup, since this is running on my computer I am using this for now
yesterday = Sys.Date()-1
first.date = as.Date("2020-01-22", "%Y.%m.%d")
date.range = first.date:yesterday

#Get data from John Hopkins CSSE
#Previous versions of this used the daily reports folder. Upon seeing the time series folder, I have switched.
confirmed.US.data.url = "https://raw.githubusercontent.com/CSSEGISandData/COVID-19/master/csse_covid_19_data/csse_covid_19_time_series/time_series_covid19_confirmed_US.csv"
confirmed.US.data = read.csv(confirmed.US.data.url)

#Graph Making
confirmed.Ohio.plot = plot()
