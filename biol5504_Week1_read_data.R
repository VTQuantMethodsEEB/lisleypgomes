amazon_data<-read.csv("BIOL5504_gomes_dataset.csv",header = TRUE,sep = ";")
#Data was not being read, so I've had to use the sep function and recognize the ; as a separator.
#DESCRIPTION OF VARIABLES (METADATA)
#DATASET NAME: BIOL5504_gomes_dataset.csv
#OBJECT NAME: amazon_data
#participant_ID: code atributed to the individual who responded the survey (interviewee)
#beef_consumption_binary: binary variable for household consumption of beef
#beef_kg_consumed: how much of beef (in kg) was consumed in the household
#beef_number_days: number of days during which consumption of beef takes place (unit time)
#cons_0_season: consumption during the low season for fish (=0)
#fish_0_consumption_binary: binary variable for household consumption of fish during the low season for fish
#fish_0_kg_consumed: how much of fish (in kg) was consumed in the household during the low season for fish
#fish_0_number_days: number of days during which consumption of fish takes place (unit time) during the low season for fish
#cons_1_season: consumption during the high season for fish (=1)
#fish_1_consumption_binary: binary variable for household consumption of fish during the high season for fish
#fish_1_kg_consumed: how much of fish (in kg) was consumed in the household during the high season for fish
#fish_1_number_days: number of days during which consumption of fish takes place (unit time) during the high season for fish
#taste_beef: From 1 (= do not like the taste of beef) to 5 (=like the taste of beef a lot)
#taste_fish: From 1 (= do not like the taste of fish) to 5 (=like the taste of fish a lot)
#town: Categorical variable indicating the name of the town the survey was conducted
#town_cat: Categorical variable indicating the size of the municipality in which the survey was conducted (large city => 100,000 inhabitants; large town = 50,000 to 100,000 inhabitants; and small town =< 50,000 inhabitants)
#age: age of the interviewee
#lived_rural_area: whether the interviewee migrated from rural area (1 = yes; 0 = no)
#connection_rural: whether anyone in the household has close friends or family in rural area (1 = yes; 0 = no)
#n_people: number of people within the household
#ppi: Poverty Probabily Index, which describe the probability (from 0 to 100) of the household falling under the poverty line
#gender: gender of the interviewee
#builtupsqkm: area (in km2) of >50% built up of the municipality of the interviewer
#builtupstd: standardized (mean of zero and SD of 1) of the builtupkm2


rm(list=ls()) # clears workspace


#load packages
library(tidyverse)
library(reshape2)

#1.
amazon_data<-read.csv("BIOL5504_gomes_dataset.csv",header = TRUE,sep = ";")
head(amazon_data)
str(amazon_data)#To see the structure of the database and the types of variables
#2.
View(amazon_data)
amazon_data[1,3] #before comma = line, after comma = column
amazon_data$beef_number_days[10] #$shows the variables and in brackets I can choose the line
summary(amazon_data) #summary of all my variables with class, mean and etc. 

#3.
mean(amazon_data$beef_kg_consumed)
sd(amazon_data$beef_kg_consumed)

#4.
f1 <- aggregate(as.numeric(beef_kg_consumed)~age+builtupsqkm,mean,data=amazon_data) #as.numeric helps R understand that data is continuous #f1 is a new object that I aggregated to understand what is the mean of consumption in function of age and urbanization
str(amazon_data$beef_kg_consumed)
#create a new data frame
dat1 = amazon_data %>% #% sums variables data and sumarise
  group_by(age, gender, beef_kg_consumed)%>% #group by age, gender and beef consumption
  summarise(N = n()) #count the data in this mix of variables

# data frame to wide format
dat1_wide = dat1 %>%
  pivot_wider(names_from = age, values_from = N,values_fill = 0) 

head(dat1_wide)


## my table
#make the flex table
library(flextable)
tdt<- flextable(data = dat1_wide) 
tdt <- theme_booktabs(tdt) 
tdt<-  autofit(tdt) 


