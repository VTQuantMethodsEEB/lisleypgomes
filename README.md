# lisleypgomes

Data Description
The .csv file named “BIOL5504_RProject_Dataset_Gomes_Chaves” is a four-tabs-spreadsheet containing data collected by Dr. Willandia Chaves from the Department of Fish and Wildlife Conservation of Virginia Tech in 2018 and 2019 in several urban and rural areas in the Brazilian Amazon. The data is related to a study of consumption and taste preference for wild (hereafter referred as fish meat) and domestic meat (hereafter referred as beef) in areas under different levels of urbanization. The data was obtained through household surveys, so the unit of analysis in this study is the response given by the household member. In this survey study, the response variables consisted of binary and count data for the consumption and ordinal data for the taste preference (please see details in the table below). The explanatory variables that could be used in this class include the level of urbanization (unit of analysis here is the municipality), which variables are both categorical and continuous, and socioeconomic factors of each respondent and household, which comprise of categorical, binary and continuous data (please see details in the table below). This data is related to my thesis as I will be conducting the same surveys over time, so I am willing to using this data to understand i) how the level of urbanization influences the consumption and preference of wild over domesticated meat and ii) what socioeconomic factors predicts the most the amount of wild and domestic meat consumed under different levels of urbanization.

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
