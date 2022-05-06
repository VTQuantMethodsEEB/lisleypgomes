rm(list=ls())

##load important packages##
library(glmmTMB)



amazon_data<-read.csv("BIOL5504_gomes_dataset.csv",header = TRUE,sep = ";", dec=",")
str(amazon_data)
amazon_data$gender<-as.factor(amazon_data$gender)
amazon_data<-na.omit(amazon_data)



#H: beef consumption depends on interaction between gender and 
#age among participants, taking account and controlling the distribution of towns. 

#try glmm.tb
## run mixed model
m.nb1 <- glmmTMB(beef_kg_consumed ~ gender*age + (1|town), data=amazon_data, family=nbinom2)

#look at mixed model
summary(m.nb1)

#interpretation:
#My GLMM model shows that there is a difference in the beef consumption between female and male, and this
#relation is significantly different. The average consumption of females is smaller than male.

