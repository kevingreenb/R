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

ggplot(aes(x = price, y = depth), data = diamonds )+
  geom_point(alpha = 1/100)+
  scale_x_continuous(breaks = seq(0,20000,2))
