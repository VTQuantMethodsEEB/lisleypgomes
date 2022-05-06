rm(list=ls()) 
library(MASS)
library(ggplot2)

amazon_data<-read.csv("BIOL5504_gomes_dataset.csv",header = TRUE,sep = ";", dec=",")
str(amazon_data)
amazon_data$gender<-as.factor(amazon_data$gender)
amazon_data<-na.omit(amazon_data)

#Make a generalized linear model (preferably with more than one variable) for one of your hypotheses. 

#Distribution negative binomial
#H = the beef consumption is significantly different for age and gender among participants.

mod.glm = glm.nb(beef_kg_consumed~age+gender, data=amazon_data)
summary(mod.glm)

#Explain what the R output is telling you about your data, in relation to your hypothesis.
#(Hint: you can use emmeans, effects, relevel, or predict to help you.)

#Explanation = 
#Plot your model (e.g. using predict) and overlay the model on top of the underlying data. Remember that you will need to use “type=response”.

new.dat <- with(amazon_data,
                expand.grid(gender=levels(gender), 
                            age=seq(min(age),max(age), by=1)
                            
                ))
#predict 
new.dat$beef_consumed <- predict(mod.glm,newdata=new.dat)
#What does this tell us?
dat.new=expand.grid(age=seq(from = min(amazon_data$age),to = max(amazon_data$age),
                             length.out = 100),gender = unique(amazon_data$gender))

#much more sensible output
dat.new$ypred  = predict(mod.glm,type="response",newdata = dat.new)
amazon_data$ypred1 = predict(mod.glm,type="response")

#setting my own theme 


plot1=ggplot(data=amazon_data,aes(x=age,y=beef_kg_consumed,color=gender))+
  geom_point(size=2,shape =1)+ylab("beef consumption (kg)")+xlab("Age (years)")+
  geom_line(data=dat.new, aes(x=age,y=ypred,col = gender)) +
  geom_line(data=amazon_data,aes(x=age,y=ypred1,col = gender))
plot1+theme_bw()
  
  
  