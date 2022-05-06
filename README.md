# lisleypgomes

 #Data Description
 
  The .csv file named “BIOL5504_gomes_dataset.csv” is a spreadsheet containing data collected by Dr. Willandia Chaves from the Department of Fish and Wildlife Conservation of Virginia Tech in 2018 and 2019 in several urban and rural areas in the Brazilian Amazon. The data is related to a study of consumption and taste preference for wild (hereafter referred as fish meat) and domestic meat (hereafter referred as beef) in areas under different levels of urbanization. The data was obtained through household surveys, so the unit of analysis in this study is the response given by the household member. In this survey study, the response variables consisted of binary and count data for the consumption and ordinal data for the taste preference (please see details in the table below). The explanatory variables that could be used in this class include the level of urbanization (unit of analysis here is the municipality), which variables are both categorical and continuous, and socioeconomic factors of each respondent and household, which comprise of categorical, binary and continuous data (please see details in the table below). This data is related to my thesis as I will be conducting the same surveys over time, so I am willing to using this data to understand i) how the level of urbanization influences the consumption and preference of wild over domesticated meat and ii) what socioeconomic factors predicts the most the amount of wild and domestic meat consumed under different levels of urbanization.

Description of variables (named as columns in the attached .csv file):

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




##WEEK 1###

CODE : biol5504_Week1_read_data.R 

DATA: BIOL5504_gomes_dataset.csv

This first week I have explored R and performed some basic calculations.

##WEEK 2##

CODE : biol5504_Week2_data_manipulation.R

DATA: BIOL5504_gomes_dataset.csv

This second week, I have explored my data by using tidy format function. I omitted my NA values to fix those mistakes in my data. I ran sumarise and mutate functions to check for differences in my grouping (age, gender and fish consumption during the low season for fish). 

##WEEK 3###

CODE : biol5504_Week3_DataVisualization.R 

DATA: BIOL5504_gomes_dataset.csv

This third week, I have explored the use of ggplot. That included plotting data (continuous and categorical), overlaying them with colors and shapes, customizing colors, scale and labels of graphs. Specifically, I wanted to understand the relationship of the amount of beef consumed according to the size of the municipality and if the person has lived or not in rural area. 

##WEEK 4###

No coding this week.

##WEEK 5###

CODE : biol5504_Week5_Tests_assignment.R

DATA: BIOL5504_gomes_dataset.csv

This fifth week, I have explored doing permutations by using the function loop as well as performing some "classic" tests for two hypothesis concerning my data.

WEEK 7##
CODE : Week7_8_LisleyGomes.R

DATA: BIOL5504_gomes_dataset.csv

I did a hypothesis that the beef consumption in kg is different among gender of participants

To check my hypothesis, I did a simple linear model where beef consumption was my response variable and gender of participants was my explanatory variable.

I did a Shapiro test to check normally from my model. My p-value was <.005 so confirming that my data does not follow a normal distribution.

After to check normally, I plotted the relationship between beef consumption in kg and gender to visualize and confirm the results from the linear model that I did before.

Then, I plotted the relationship in ggplot using stat_smooth (method = "linear")

WEEK 8##
#1. Make a linear model (with more than one variable) for one of your hypotheses. Articulate which hypothesis you are testing. #Consider the age in addition to gender of participants 

#H2 = the beef consunptiom in kg is significantly different for gender and age of participants.
#Output model results:

The female gender is set as my intercept. There is no difference on beef consumption among gender (p > 0.005) and also no significantly varies over ages (p > 0.005).

#2. Use an interactive model and an additive model. Explain what hypothesis each of these is testing, and what the R output is telling you about your data.

#H2 = the beef consumption depends on age and gender of participants.

I ran an interactive model where beef consumption was set as response variable and age and gender as a explanatory variables.


Then, I ran allEffects function to check all average values from all my variable levels.

#Output model results: The female gender is my intercept. The output shows that beef consumption not depends on age and gender of participantes, where there is not significantly difference between ages and genders.

#3. Plot your model (e.g. using predict) and overlay the model on top of the underlying data.

#Plot interpretation

Beef consumption do not varies among gender and age. In the average, seems that people eat less beef does not matter the age or gender.

WEEK 10##
CODE : Week10_LisleyGomes.R

DATA: BIOL5504_gomes_dataset.csv

I did a GLM model with negative binomial family based on the residual distribution that I got from last week.

#H1 =  The beef consumption in kg is different among gender of participants across ages.


#Explain what the R output is telling you about your data, in relation to your hypothesis.

#Explanation = The beef consumption seems to be significant related to the age and gender.As my gender variable is categorical, my female gender is set as intercept. The beef consumption seen to depend on the gender, and this relationship is significant different when comparing across ages.

Then, I plot my observed data and predict data overlap to see if they fits appropriately. I used predict function to see if my observed data fits well with predict values.

WEEK 11##
CODE : Week11_LisleyGomes.R

DATA: BIOL5504_gomes_dataset.csv

I did a GLM model with negative binomial family based on the residual distribution that I got from last week.

#Likelihood ratio test

For likelihood ratio tests, I used 3 models from my data:

modelnull= a null model (beef consumed); 
model= a simple model (beef consumed ~ gender); 
model1= an additive model (beef consumed ~ gender + age);
model2= an interactive model (beef consumed ~ gender*age).

The likelihood ratio tests for model comparison shows the simple model is the one which has a lower difference in numbers of parameters. Based on the likelihood ratio test, gender model is my best model that explained the relationship between beef consumed and gender across ages.

#Model selection

#AIC model selection

After ran each model structure, I checked model has the best weight based on dAIC. The interactive model (n4) showed the beef consumed and lower dAIC from the rank selection against the other model structures.

#Extra #cross-validation

For a model selection approach, I choose to use cross-validation function from the package caret. First, I set up the number of folds for cross-validation by defining the training control. I chose 10 folds, which means divide data into ten parts, and using model to predict the remaining 10%.

I used my two models, one additive (model 1) and another interactive (model2). My model 2 accounts for 0.2% of the variance (R-squared = 0.02) in catch scores.

WEEK 12##
CODE : Week12_LisleyGomes.R

DATA: BIOL5504_gomes_dataset.csv

For this mixed model, I get the hypothesis that beef consumption depends on interaction between age and gender among participants, taking account and controlling the distribution of towns levels. Towns are considered as repeated samples units over surveys. So, I do include this explained variation in my model and make sure that it not influencing in my model output.

I used, as previous weeks, a generalized linear model with a negative binomial distribution by using the package glmmTMB.

Explanation: Beef consumption depends on the interaction between gender among participants. The interaction between age and gendr significantly affected the amount of beef consumed. Consumption from male has a significant difference compared to female, showing a higher consumption. 

