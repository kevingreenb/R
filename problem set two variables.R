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
  
