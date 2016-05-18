install.packages("knitr")
install.packages("haven")
install.packages("tidyr")
install.packages("pander")
install.packages("car")

library("knitr")
library("ggplot2")
library("haven")
library("tidyr")
library("pander")
##Pander works well when your end output is Word, most packages do HTML and PDFs well.

getwd()

atlas<-read_sav("data/ATLAS.sav")

str(atlas)
head(atlas)
View(atlas)
summary(atlas)
list.files()

model1 <- lm(STSE1 ~ STSE0 + intervention, data=atlas, na.action=na.exclude)
#na.exclude does listwise deletion, same as na.omit, but saves information about which cases were dropped, so is more useful
#see whether students' strength-training self-efficacy at post-test is related to self-esteem at post-test
model2 <- lm(STSE1~SE1, data=atlas, na.action=na.exclude)
##Whether students' strength-training self-efficacy at post-test is different for intervention vs control (a factor variable)
model3 <- lm(STSE1~intervention, data=atlas, na.action=na.exclude)
##whether STSE1 depends on intervention, selfesteem at post-test, STSE0, and intervention depending on self-esteem at pretest
model4 <- lm(STSE1~intervention+SE1++SE0+STSE0+intervention:SE0, data=atlas, na.action=na.exclude)
#OR
model4 <- lm(STSE1~STSE0+SE1+ intervention*SE0)
## The * gives main effects for each and the interaction
##When doing an interaction term from 2 continuous predictors, center them first

summary(atlas)

str(model1)
plot(model1)

library(car)
##To get results ANOVA style (with sums of squares and F tests instead of coefficients
car::Anova(model1,type=3) #type 3 sum of squares
##DON'T USE AOV! It doesn't use type 3 sum of squares



