################################################
### Counts plots for for monthly split data ####
########## by Olga Gasparyan ###################
#############  April 03, 2022 ##################

#clean environment
rm(list = ls())

#install and load necessary packages 
require(dplyr)
require(ggplot2)

#set working directory
setwd("YOUR DIR HERE")

#load the files from a working directory
data=read.csv("all_cc_tweets_months_deid.csv")
data_health=read.csv("all_health_tweets_monthly_deid.txt")


#create a new data set with counts per months for cc tweets
data_count_cc=data%>%
  group_by(month)%>%
  summarise(n_cc=n())
data_count_cc=na.omit(data_count_cc) 

#create a new data set with counts per months for health tweets
data_count_health=data_health%>%
  group_by(month)%>%
  summarise(n_health=n())

#merge two catasets with counts together based on months
data_count=data_count_cc%>%left_join(data_count_health, by="month")

#create a char variable for the month name
data_count$month_name=NA
data_count$month_name[data_count$month==1]="Jan"
data_count$month_name[data_count$month==2]="Feb"
data_count$month_name[data_count$month==3]="Mar"
data_count$month_name[data_count$month==4]="Apr"
data_count$month_name[data_count$month==5]="May"
data_count$month_name[data_count$month==6]="Jun"
data_count$month_name[data_count$month==7]="Jul"
data_count$month_name[data_count$month==8]="Aug"
data_count$month_name[data_count$month==9]="Sep"
data_count$month_name[data_count$month==10]="Oct"
data_count$month_name[data_count$month==11]="Nov"
data_count$month_name[data_count$month==12]="Dec"



#Total Number of CC tweets per month Plot
ggplot() +
  geom_bar(data=data_count, aes(y=n_cc, x=reorder(month_name, month)),
           stat="identity", width=0.75, color="black", fill="lightgrey")+
  theme_minimal()+
  xlab("Month")+
  ylab("Number of 'climate change' tweets")



#Total number of health in CC tweets per month plot

ggplot() +
  geom_bar(data=data_count, aes(y=n_health, x=reorder(month_name, month)),
           stat="identity", width=0.75, color="black", fill="lightgrey") +
  xlab("Month")+
  ylab("Number of 'health' tweets in 'climate change' set")+
  theme_minimal()
