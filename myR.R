rm(list=ls()) #remove all variable stores prevoiously loaded
library(Hmisc) #import

data <- read.csv("F:/Covid_R(Bhanu)/COVID19_line_list_data.csv")
describe(data) #Hmisc command
#clean the death column
data$death_dumm<- as.integer(data$death != 0)
# death rate
sum(data$death_dumm) / nrow(data)

#Age
dead = subset(data, death_dumm == 1)
alive= subset(data, death_dumm == 0)

mean(dead$age, na.rm = TRUE)# if showing NA for write along with na.rm = TRUE
mean(alive$age, na.rm= TRUE)


# statisctic significant
t.test(alive$age, dead$age, alternative = "two.sided", conf.level = 0.98)


#Gender
men = subset(data, gender == "male")
women = subset(data, gender == "female")
mean(men$death_dumm, na.rm = TRUE)
mean(women$death_dumm, na.rm = TRUE)
#t.test(alive$age, dead$age, alternative = "two.sided", conf.level = 0.98)

