reddit <- read.csv('reddit.csv')
getwd()
setwd('~/Documents')
reddit
levels(reddit$age.range)

install.packages('ggplot2', dependencies = T)
library(ggplot2)
qplot(data = reddit, x = age.range)

