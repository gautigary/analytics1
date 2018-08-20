# data structures

#vectors----
#atomic, lowest in R
v1 = 1:100 #create vector from 1 to 100
v2 = c(1,4,5,10)
class(v1) #integer
class(v2) #numeric double
v3 = c('a','gautam')
class(v3)
v4 = c(TRUE, FALSE, T, F, T)
class(v4) #logical

#summary on vectors
mean(v1)
median(v1)
sd(v1)
hist(v1)
hist(women$height)
v2[v2>5]

x= rnorm(60, mean = 60, sd = 10) #creates a normal distribution with given props
x
plot(x)
hist(x)
plot(density(x)) #gives the density curve 
abline(v=60) # draws a line at given value
#rectangles and density together
hist(x, freq = F) #f here stands for false, freq not to be displayed, gives density instead
lines(density(x))
hist(x, breaks = 10, col = 1:10) #breaks is used for specifying the number of columns
length(x)
sd(x)

?sample
x1= LETTERS[5:20]
set.seed(1234) # to keep the same pattern of values in the sample
y1 = sample(x1)
y1
y2 = sample(x1, size = 5) 
gender = sample(c('M','F'), size = 1000000, replace = T, prob = c(.6,.4))
t1 = table(gender)
prop.table(t1) #prop stands for proportion
pie(t1)
barplot(t1, col = 1:2)


#matrix----
(m1= matrix(1:24, nrow = 4)) #4 rows
(m1= matrix(1:24, nrow = 4, byrow = T)) #data will get filled up row wise
(m1= matrix(1:24, ncol = 4, byrow = T)) #4 columns

x= runif(60, 60, 100)
x
#round, truncate, ceiling, floor

plot(density(x))
x = trunc(runif(60,60,100))
(m4 = matrix(x, ncol = 6))
colSums(m4)
rowSums(m4)
rowMeans(m4)
m4[m4>67]
m4[m4>67 & m4<86]
m4[1,]

m4[8:10, c(1,3,5)]
m4
rowSums(m4[8:10, c(1,3,5)])
#array----

#dataframe
#rollno, name, gender, course, marks1, marks2
(rollno = 1:60)
(name= paste('student',1:60, sep = '-'))
(name[5:20])
(name[c(5,13,15,20)])
(name[-1])
s1 = 1
s1 = 1
(gender = sample(c('male', 'female'), size = 60, replace = T, prob = c(.3,.7)))
(course = sample(c('MBA', 'BBA', 'FPM'), size = 60, replace = T, prob = c(.7,.2,.1)))
(marks1 = ceiling(rnorm(60,mean = 65, sd = 7)))
(marks2 = ceiling(rnorm(60, mean = 60, sd = 11)))
(grades = sample(c('A','B','C'), size = 60, replace = T))
students = data.frame(rollno, name, gender,course,marks1,marks2,grades, stringsAsFactors = F)
class(students)
summary(students)
students[, c('name')]

students[students$gender == 'male' & students$marks1 > 0, c('name', 'rollno')]
a =students[students$marks1>55 & students$marks2>55, c('name', 'marks1', 'marks2')]
nrow(a)

str(students)
nrow(students)
names(students)
dim(student)
head(students)
tail(students)
#average marks scored by each gender in marks1

aggregate(students$marks1, by = list(students$gender), FUN = mean)
aggregate(students$marks2, by = list(students$course), FUN = max)
aggregate(students$marks2, by = list(students$course, students$gender), FUN = mean)


#dplyr

library(dplyr)
students%>% group_by(gender) %>% summarize(mean(marks1))
students %>% group_by(gender, course)%>% summarize(meanmarks1 = mean(marks1), min(marks1), max(marks2)) %>% arrange(desc(meanmarks1))
sample_frac(students, 0.1, replace = T)
sample_n(students, 10, replace = T)


#FACTORS
#factors have to category types
names(students)

students$gender = factor(students$gender)
students$course = factor(students$course, ordered = T)
summary(students$gender)
summary(students$course)
students$course = factor(students$course, ordered = T, levels = c('FPM', 'MBA', 'BBA'))
summary(students$course)
students$grades = factor(students$grades, ordered = T, levels = c('c','B','A'))
students$grades
table(students$grades)
barplot(table(students$grades))

students
write.csv(students, './data/iimtrichy.csv')
students2 = read.csv('./data/iimtrichy.csv', stringsAsFactors = F)
students2
head(students2)
student3 = read.csv(file.choose())
head(student3)

