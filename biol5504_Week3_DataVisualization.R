#Notes from class####
#color is a plot, if you want to show your data according to another variable

#important to set each graph to an object

#point and size is for a point graph

#boxplot adds a boxplot to the graph

#if you get read of the color command, you have one bar for each variable only, no points by site

#you can also draw points over the boxplots. you add the geompoint and add aesthetics (aes) with color to create an hybrid 

#geom jitter is a command that allows you to add the noise to your data to help visualization, creating a little bit of space between the poitns.

#Aesthetics can be done by color or by shape

#you can also change the name of variables by adding one collumm and use == to say which collumm it is equal to, and  use = and say that the data = to the new word you've created

#to costumize the labels of the graph, you use ylab and xlab, expression log10~name1~name2~name3, etc

#scale_color_manual is used to customize colors

#theme is where you change the size of your labels, size of legend and legend text, background colors. Theme_bw is the buit in customization (black and white).

#discrete = T

#ggsave is a very useful function to save the file and .format you want it to be. You specify the units (inches).  Use dingbats = FALSE helps you not to save the circles of the R in the image as an actual image.

#facet_wrap is a command to create multiple pannels (multiple smalls), the you say how many collumms and rows you need.

#theme_set set the theme as a default for other codes after that.

#for multiple aestethics attributes, you can combine color and shape, adding that to the top line

#when you have dates as X axis, it is tricky to draw lines and having the data temporal continuous variable. So, you need to tell R "as.date" command and call the X axis . Use scale-x-date to customize the scale of the time period variabe you are using.

rm(list=ls()) # clears workspace

#Assignment Week3_data_visualization

#1.load important packages####
library(ggplot2)
library(gridExtra)
library(viridis)


#2. Input data into R####
#setting directory, reading data and transforming into log
setwd("C:/Users/lili-/OneDrive/Área de Trabalho/biol5504_rproject_gomes")
amazon_data=read.csv("BIOL5504_gomes_dataset.csv", header = TRUE,sep = ";") 
#or
amazon_data=read.csv("BIOL5504_gomes_dataset.csv", header = TRUE,sep = ";")
head(amazon_data)
amazon_data$lgdL=log10(as.numeric(amazon_data$beef_kg_consumed)) #transformed into log scale my response variable i.e. amount of beef consumed in the household
#ommit NA from DATA
amazon_data=na.omit(amazon_data)
#3. Plotting the data####
#Ggplot with points and colors
ggplot(data=amazon_data, aes(x = town_cat, y = lgdL, color=as.factor(lived_rural_area)), na.rm=TRUE)+
  geom_point(size=2) #x was a categorical variable i.e. the size of the municipality and color was the binary variable whether the person has ever lived in rural areas
#I used the function "as.factor" for R to understand that my color variable is binary.

#Ggplot with points
g1=ggplot(data=amazon_data, aes(x = town_cat, y=lgdL,color=as.factor(lived_rural_area)))+
  geom_point(size=2) #this adds points to graph
g1
#a simple graph with town size category on x, and lgdL (log of amount in kg of beef consumed) on Y, if the person lived in rural area as color

g1=ggplot(data=amazon_data,aes(x=town_cat,y=lgdL,color=as.factor(lived_rural_area)))+
  geom_boxplot() #this add a boxplot to the graph
g1
#lots of variation in my data and no differences among them

g2=ggplot(data=amazon_data,aes(x=town_cat,y=lgdL))+
  geom_boxplot()
g2
#this is okay, but how many samples come from these? Mine graph did not change and color remained in the graph when I had the same object name. When I changed the object name, color disappeared from it.

g3=ggplot(data=amazon_data,aes(x=town_cat,y=lgdL))+
  geom_boxplot()+
  geom_point(aes(color=as.factor(lived_rural_area))) #now assign color here so we don't have separate boxes
g3

g4=ggplot(data=amazon_data,aes(x=town_cat,y=lgdL))+
  geom_boxplot()+
  geom_jitter(aes(shape=as.factor(lived_rural_area)))
g4 #as jitter increases the spaces among points, the graph remained very weird.

#geom_point(aes(color=lived_rural_area), alpha = 0.2) #now assign color here so we don't have separate boxes
g1
#now we can look at it in more compact form, but still see the data come from multiple factors from living in rural areas

#we only need "categories of town" because we are using the codes "large_city" etc, but these are unnecessary
amazon_data$town_cat=as.character(amazon_data$town_cat)
amazon_data$town_cat[amazon_data$town_cat=="city"]="City"
amazon_data$town_cat[amazon_data$town_cat=="large_town"]="Large town"
amazon_data$town_cat[amazon_data$town_cat=="small_town"]="Small town"


g5=ggplot(data=amazon_data,aes(x=town_cat,y=lgdL))+
  geom_boxplot()+
  geom_point(aes(color=as.factor(lived_rural_area)))+
  ylab(expression(log[10]~amount~of~beef~consumed~(kg)))+ #change y axes (use an expression to get a log value)
  xlab("Municipality size category") #change x axes
g5
#now the axes are better... MUCH BETTER!

#now, let's improve look of the figure
g6=ggplot(data=amazon_data,aes(x=town_cat,y=lgdL))+
  geom_boxplot()+
  geom_point(aes(color=as.factor(lived_rural_area)))+
  ylab(expression(log[10]~amount~of~beef~consumed~(kg)))+
  xlab("Municipality size category")+
  #scale_colour_viridis(discrete = T)+ #this comes with the viridis package
  scale_colour_manual(values = c("#CC6666", "#66CC99"))+
  theme_bw()
g6
#this looks much better, but I'd like some additional options. I changed the color codes, but couldn't find a option for other color codes online.

g7=ggplot(data=amazon_data,aes(x=town_cat,y=lgdL))+
  geom_boxplot()+
  geom_point(aes(color=as.factor(lived_rural_area)),size=2,shape=1,stroke=1.2)+#shape specifies donut, and stroke changes thickness
  ylab(expression(log[10]~amount~of~beef~consumed~(kg)))+
  xlab("Municipality size category")+
  scale_colour_viridis(discrete = T)+
  theme_bw()+
  theme(axis.title=element_text(size=23),
        axis.text=element_text(size=15),
        panel.grid = element_blank(), 
        axis.line=element_line(),
        axis.text.x = element_text(angle = 90, hjust = 1,face="italic"),
        legend.position="top",
        legend.title = element_blank(),
        legend.text = element_text(size=20),
        legend.background = element_blank(),
        legend.key=element_rect(fill="white",color="white"))
g7


#4.saving the file####
ggsave(file="C:/Users/lili-/OneDrive/Área de Trabalho/biol5504_rproject_gomes/municipality_beef_livedrural.pdf", 
       plot=g7,
       width=7,height=7,units="in",dpi=300,
       useDingbats=FALSE) #use Dingbats is surprisingly useful because it prevents points from being turned in o's in some programs


#5.showing the same data, but show multiple "smalls"
g8=ggplot(data=amazon_data,aes(x=town_cat,y=lgdL))+
  facet_wrap(~town_cat,ncol=1,nrow=3)+ #this is creating multiple "panels" for site
  geom_boxplot()+
  geom_point(aes(color=as.factor(lived_rural_area),size=1.2))+
  ylab(expression(log[10]~amount~of~beef~consumed~(kg)))+
  xlab("Municipality size category")+
  scale_colour_viridis(discrete = T)+
  theme_bw()+
  theme(axis.title=element_text(size=23),
        axis.text=element_text(size=15),
        panel.grid = element_blank(), 
        axis.line=element_line(),
        axis.text.x = element_blank(),
        legend.position="topright",
        legend.title = element_text("Lived in rural area"),
        legend.text = element_text(size=15),
        legend.background = element_blank(),
        legend.key=element_rect(fill="white",color="white"))
g8


#6. Ploting continuous variables####

#let's set our theme to condense the code a bit...
theme_set(theme_bw()+
            theme(axis.title=element_text(size=23),
                  axis.text=element_text(size=15),
                  panel.grid = element_blank(), 
                  axis.line=element_line(),
                  axis.text.x = element_text(),
                  legend.position="topright",
                  legend.title = element_text("Lived in rural area"),
                  legend.text = element_text(size=15),
                  legend.background = element_blank(),
                  legend.key=element_rect(fill="white",color="white")))

#note - we can get back to default by resetting to theme_gray - OK

#continuous graph
g9=ggplot(data=amazon_data,aes(x=age,y=lgdL,color=as.factor(lived_rural_area)))+
  geom_point(size=2)
g9


#If needed to work with date, use the link below:
#http://ggplot2.tidyverse.org/reference/scale_date.html

