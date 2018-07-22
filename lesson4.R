library(ggplot2) #must load the ggplot package first
data(diamonds) #loads the diamonds data set since it comes with the ggplot package
names(diamonds)
summary(diamonds)
?diamonds

qplot(x = diamonds$price, data = diamonds)
qplot(x = diamonds$price, data = diamonds, xlim = c(500,1000),
      binwidth = 100, color = I('black'))

less500 <- subset(diamonds, diamonds$price <500)
less250 <- subset(diamonds, diamonds$price < 250)
more15000 <- subset(diamonds, diamonds$price >= 15000)

qplot(x = diamonds$price, data = diamonds)+
  facet_wrap(~cut)

summary(diamonds)

most <- subset(diamonds, diamonds$price == 18823)
most
lowest <- subset(diamonds, diamonds$price == 326)
lowest

by(diamonds, diamonds$cut, summary)
qplot(x = price, data = diamonds) + 
  facet_wrap(~cut, scales = "free") +
  scale_x_log10()

qplot(x = clarity, y = price,
      data = diamonds, 
      geom = 'boxplot')+
  scale_y_continuous(limits = c(0,6000))

qplot(x = color, y = price,
      data = diamonds, 
      geom = 'boxplot')+
  scale_y_continuous(limits = c(0,6000))
names(diamonds)
?diamonds
colorD = subset(diamonds,color == 'D')
colorJ = subset(diamonds,color == 'J')
summary(colorD)
summary(colorJ)

IQR(colorD$price)
IQR(colorJ$price)

qplot(x = friend_count, y = ..count../sum(..count..), 
      data = subset(pf, !is.na(gender)),
      xlab = 'Friend Count',
      ylab = 'Proportion of Users with that Friend Count',
      binwidth = 10, geom = 'freqpoly', color = gender) +
  scale_x_continuous(lim = c(0,1000), breaks = seq(0, 1000, 50))

qplot(x = carat, data = diamonds,binwidth = 0.5)+
  scale_x_continuous(breaks = seq(0.25, 1.5, 0.1), lim = c(0.25,5))+
  scale_y_continuous(breaks = seq(0,10000,1000), lim = c(0,3000))

qplot(x = carat, data = diamonds, geom = 'freqpoly')+
  scale_x_continuous(breaks = seq(0,2.5,0.2), lim = c(0,2.5))+
  scale_y_continuous(lim = c(2000,15000))

summary(diamonds$carat)

df <- diamonds$carat
table(unlist(df))
as.data.frame(table(unlist(df)))