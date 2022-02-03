# assignment 2 data_manipulation  


#load important packages##
library(tidyverse)
library(tidyr)
library(dplyr)

#2. Input your data into R
amazon_data<-read.csv("BIOL5504_gomes_dataset.csv",header = TRUE,sep = ";")

head(amazon_data)  
unique(amazon_data$fish_0_kg_consumed)
hist(amazon_data$fish_0_number_days)

amazon_data$lgdL=log10(as.numeric(amazon_data$fish_0_kg_consumed))#log the kg consumed 
ama<-aggregate(as.numeric(fish_0_kg_consumed)~age+gender,data=amazon_data, FUN=mean)  #make a df of amazon_data



#1. Put your data in tidy format
dat1 = amazon_data %>% #% sums variables data and sumarise
  group_by(age, gender, beef_kg_consumed)%>% #group by age, gender and beef consumption
  summarise(N = n()) #count the data in this mix of variables

# data frame to wide format
dat1_wide = dat1 %>%
  pivot_wider(names_from = age, values_from = N,values_fill = 0) 

#3.Examine your data for mistakes
#omit NA
amazon_data1=na.omit(amazon_data)

#4. Experiment with “group by” in dplyr to do some calculation####
## Group by, Mutate, and Summarise
amazon_data1 %>% 
  group_by(age) %>% 
  summarise(mean=mean(as.numeric(amazon_data1$fish_0_kg_consumed)))#if you don´t omit use na.rm=T
#this gives you a summary table, it doesn't change amazon_data1


#5. Use mutate and summarise on your data####
#How are these different? Annotate your code to explain. 

##Summarise versus Mutate
#creating a new summary (mean) table
sum.table = amazon_data1 %>% 
  group_by(age,gender) %>% 
  summarise(mean.ama=mean(as.numeric(amazon_data1$fish_0_kg_consumed)))

#creating a new summary (mean) table by mutate
amazon_data1 %>% 
  group_by(age, gender) %>% 
  mutate(mean=mean(as.numeric(amazon_data1$fish_0_kg_consumed)))#if you don´t omit use na.rm=T

#A: mutate added a new variable (mean) and maintain existing ones while sumarise 
#creates a new data frame (sum.table) just with the grouping existing variables. 


#6. Commit and push to GitHub. Be sure to update your README!
#Script and README upload to GitHub