rm(list=ls())

##load important packages##
library(tidyverse)
library(tidyr)
library(dplyr)
library(glmmTMB)
library(ggplot2)

amazon_data<-read.csv("BIOL5504_gomes_dataset.csv",header = TRUE,sep = ";", dec=",")
str(amazon_data)
amazon_data$gender<-as.factor(amazon_data$gender)
amazon_data<-na.omit(amazon_data)


#H: beef consumption depends on interaction between gender and 
#age among participants, taking account and controlling the distribution of town category. 


## run mixed model
model<- glmmTMB(beef_kg_consumed ~ gender*age + (1|town_cat), data=amazon_data, family=nbinom2)

summary(model)

plot1=ggplot(data=amazon_data,aes(x=age,y=beef_kg_consumed,color=gender))+
  geom_point(size=3)+ylab("Beef consumed (kg)")+xlab("age (years)")

plot1+theme_test()
