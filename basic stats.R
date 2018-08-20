# Basic stats

x= ceiling(rnorm(10000, mean= 60, sd = 20))
mean(x)
median(x)
table(x)
sort(table(x), decreasing = T)


install.packages("modeest")
library(modeest)
mlv(x,method = 'short')

quantile(x)
?seq
quantile(x,seq(.1,1,by=.1)) #decile
quantile(x,seq(.01,1,by=.01)) #percentile

install.packages('e1071')
plot(density(x))
e1071::skewness(x)
e1071::kurtosis(x)

sd(x);var(x)
cov(women$weight, women$height)
cor(women$height, women$weight)

stem(x)

#freq table


install.packages('fdth')
library(fdth)
ftable1 = fdt(x)
ftable1
?fdt
