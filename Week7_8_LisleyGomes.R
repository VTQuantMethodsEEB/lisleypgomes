rm(list=ls())
#loading package used
library(corrplot)
library(car)
library(arm)
library(multcomp)
library(ggplot2)
library(tidyverse)
library(tidyr)
library(dplyr)
library(effects)
library(MASS)

setwd("C:/Users/lili-/OneDrive/Área de Trabalho/biol5504_rproject_gomes/lisleypgomes")
#using the amazon data - read
amazon_data<-read.csv("BIOL5504_gomes_dataset.csv",header = TRUE,sep = ";", dec=",")
str(amazon_data)
amazon_data$gender<-as.factor(amazon_data$gender)

#1.Input data into R####
#setting directory and reading data



#Make an univariate linear model for one of your hypotheses___####
#H1 =  The beef consumption in kg is different among gender of participants
##Null_Hypothesis: The mean beef preference score (likert scale, categorical) is not different among gender of participants



mod<-lm(beef_kg_consumed~gender, data=amazon_data);summary(mod)

#Examine the assumptions of linearity (using tests and diagnostic plots)___####

plot(mod)

hist(resid(mod))
shapiro.test(sample(resid(mod), 500))#get normally by using a sample from my data


## After checking my residuals, I saw that my data do not follow a normal distribution




#Plot the relationship in ggplot using stat_smooth or stat_summary___####

r=ggplot(data=amazon_data, aes(x=gender, y=beef_kg_consumed))+ 
  geom_point()+
  stat_smooth(method = "lm")+
  theme_bw() + labs(x="Gender",y="Beef consumed (kg)")+
  theme(axis.title=element_text(size=20),axis.text=element_text(size=10),
        panel.grid = element_blank(), axis.line=element_line())
        
print(r)

#PART 2####

#1. Make a linear model (with more than one variable) for one of your hypotheses. Articulate which hypothesis you are testing.

#H1 =  The beef consumption in kg is different among gender of participants across ages.

mod1<-lm(beef_kg_consumed~gender+age, data=amazon_data);summary(mod1)

#2. Use an interactive model and an additive model. Explain what hypothesis each of these is testing, and what the R output is telling you about your data.
#(Hint: you can use emmeans, effects, relevel, or predict to help you.) You should include this explanation in either your README or in your code.

#H2 =  The beef consumption in kg depends on the interaction among gender of participants and towns.
mod_inter<-lm(beef_kg_consumed~gender*age, data=amazon_data);summary(mod_inter)


summary(allEffects(mod_inter))

#3. Plot your model (e.g. using predict) and overlay the model on top of the underlying data. See code for example to plot both model and data (on github).

#make a new dataframe
new.dat <- with(amazon_data,expand.grid(gender=levels(gender), 
                                   age=seq(min(age),max(age), by=1)))

#predict beef consumed using new data frame
new.dat$beef_kg_consumed <- predict(mod_inter,newdata=new.dat)

#additive model
ggplot(new.dat,aes(x=age,y=beef_kg_consumed,colour=gender))+ 
  geom_line(aes(group=gender))+ 
  geom_point(data=amazon_data, aes(x=age,y=beef_kg_consumed,colour = gender)) 

#interactive model 
ggplot(amazon_data,aes(x=gender,y=beef_kg_consumed))+ 
  geom_point(data=amazon_data, aes(x=gender,y=beef_kg_consumed)) 

###plotting prediction + data with continuous example#
ggplot(new.dat,aes(x=age,y=beef_kg_consumed,colour=gender))+ 
  geom_line(aes(group=gender))+ 
  geom_point(data=amazon_data, aes(x=age,y=beef_kg_consumed,colour = gender)) 


plot(allEffects(mod_inter))
