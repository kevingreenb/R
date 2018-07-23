library(ggplot2)
data(diamonds)
ggplot(aes(x = x, y = price), data = diamonds)+
  geom_point()

with(diamonds, cor.test(x, price))

## 
##  Pearson's product-moment correlation
## 
## data:  x and price
## t = 440.16, df = 53938, p-value < 2.2e-16
## alternative hypothesis: true correlation is not equal to 0
## 95 percent confidence interval:
##  0.8825835 0.8862594
## sample estimates:
##       cor 
## 0.8844352


with(diamonds, cor.test(y, price))

## 
##  Pearson's product-moment correlation
## 
## data:  y and price
## t = 401.14, df = 53938, p-value < 2.2e-16
## alternative hypothesis: true correlation is not equal to 0
## 95 percent confidence interval:
##  0.8632867 0.8675241
## sample estimates:
##       cor 
## 0.8654209

with(diamonds, cor.test(z, price))

names(diamonds)

ggplot(aes(x = depth, y = price), data = diamonds )+
  geom_point(alpha = 1/100)+
  scale_x_continuous(breaks = seq(0,20000,2))
with(diamonds, cor.test(depth, price))
with(diamonds, cor.test(price, depth))

# Pearson's product-moment correlation
# 
# data:  price and depth
# t = -2.473, df = 53938, p-value = 0.0134
# alternative hypothesis: true correlation is not equal to 0
# 95 percent confidence interval:
# -0.019084756 -0.002208537
# sample estimates:
# cor 
# -0.0106474 

# Create a scatterplot of price vs carat
# and omit the top 1% of price and carat
# values.
price99 <- quantile(diamonds$price, 0.99)
carat99 <- quantile(diamonds$carat, 0.99)
  ggplot(aes(x = carat, y = price), 
         data = subset(diamonds, price<price99 & carat <carat99))+
    geom_point()
  
  # Create a scatterplot of price vs. volume (x * y * z).
  # This is a very rough approximation for a diamond's volume.
  
  # Create a new variable for volume in the diamonds data frame.
  # This will be useful in a later exercise.
  diamonds$volume <- diamonds$x * diamonds$y * diamonds$z
  ggplot(aes(x = volume, y = price), data = diamonds)+
    geom_point()
  
  # Did you notice some outliers? Some volumes are 0! There's an expensive diamond with a volume near 4000, and a cheaper diamond with a volume near 900.
  # 
  # 
  # You can find out how many diamonds have 0 volume by using count(diamonds$volume == 0). The count() function comes with the plyr package.
  # 
  # 
  # Note: If you ran the count function from plyr, you need to run this command in R to unload the plyr package.
  # detach("package:plyr", unload=TRUE)
  # The plyr package will conflict with the dplyr package in later exercises.
  # 
  # 
  # Depending on your investigation, it may or may not be important for you to understand how outliers, like these, came to be in your data.
  # 
  
  # Subset the data to exclude diamonds with a volume
  # greater than or equal to 800. Also, exclude diamonds
  # with a volume of 0. Adjust the transparency of the
  # points and add a linear model to the plot.
  ggplot(subset(diamonds, 0 < volume & volume < 800), aes(x=volume, y=price)) + 
    geom_point(alpha=0.05) +
    geom_smooth(method='lm', color='red')
  
  with(diamonds, cor.test(price, volume))
  
  library(dplyr)
  # Use the function dplyr package
  # to create a new data frame containing
  # info on diamonds by clarity.
  
  # Name the data frame diamondsByClarity
  
  # The data frame should contain the following
  # variables in this order.
  
  #       (1) mean_price
  #       (2) median_price
  #       (3) min_price
  #       (4) max_price
  #       (5) n
  
  # where n is the number of diamonds in each
  # level of clarity.
  diamondsByClarity <- group_by(diamonds, clarity) %>%
    summarise( mean_price=mean(price),
               median_price=median(price),
               min_price=min(price),
               max_price=max(price),
               n=n())
  
  diamonds_by_clarity <- group_by(diamonds, clarity)
  diamonds_mp_by_clarity <- summarise(diamonds_by_clarity, mean_price = mean(price))
  
  diamonds_by_color <- group_by(diamonds, color)
  diamonds_mp_by_color <- summarise(diamonds_by_color, mean_price = mean(price))
  # We've created summary data frames with the mean price
  # by clarity and color. You can run the code in R to
  # verify what data is in the variables diamonds_mp_by_clarity
  # and diamonds_mp_by_color.
  
  # Your task is to write additional code to create two bar plots
  # on one output image using the grid.arrange() function from the package
  # gridExtra.
  
  library(gridExtra)
  p1 <- ggplot(diamonds_mp_by_clarity, aes(x=clarity, y=mean_price)) + geom_bar(stat='identity')
  p2 <- ggplot(diamonds_mp_by_color, aes(x=color, y=mean_price)) + geom_bar(stat='identity')
  grid.arrange(p1,p2,ncol=1)