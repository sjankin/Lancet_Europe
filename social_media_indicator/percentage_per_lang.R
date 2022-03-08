################################################
### Percentage plots for terms per language ####
########## by Olga Gasparyan ###################
#############  March 05, 2022 ##################

#clean environment
rm(list = ls())

#install and load necessary packages 
require(dplyr)
require(ggplot2)

#set working directory
setwd("YOUR DIR HERE")

#load the file from a working directory
data=read.csv("percentages.csv")


#HEALTH
#transform data
data_health=data%>%
  subset(select = c(health, language)) 
#change NAs to 0s
data_health$health[is.na(data_health$health)]=0


#plot of health %
ggplot(data=data_health, aes(y=reorder(language, health), x=health)) +
  geom_bar(stat="identity", width=0.75, color="black", fill="grey")+
  theme_minimal()+
  xlab("% of tweets mentioning word 'health' in total # of 'climate change' tweets")+
  ylab("Language")



#DISEASE
#transform data
data_disease=data%>%
  subset(select = c(disease, language)) 
#change NAs to 0s
data_disease$disease[is.na(data_disease$disease)]=0

#plot of disease %
ggplot(data=data_disease, aes(y=reorder(language, disease), x=disease)) +
  geom_bar(stat="identity", width=0.75, color="black", fill="grey")+
  theme_minimal()+
  xlab("% of tweets mentioning word 'disease' in total # of 'climate change' tweets")+
  ylab("Language")




