####################################################
## Homework 2 
## Author: Anna Pede
##Perm number: 6870646

library(tibble)
library(dplyr)
library(tidyverse)
library(usethis)
library(gitcreds)

## Part 2
#1
airbnb <-readr::read_csv("assign_2.csv")
airbnb <- as_tibble(airbnb)

airbnb<-airbnb %>%
  rename(neighborhood = neighbourhood)

#2
neighborhoods<-airbnb %>% 
  count(neighborhood)

neighborhoods<-neighborhoods %>% 
  filter(!is.na(neighborhood))

neighborhoods <-neighborhoods %>%                                     
  arrange(desc(n)) %>% 
  slice(1:20)

#c
airbnb_top_neighborhoods<-airbnb %>%
  filter(neighborhood %in% neighborhoods$neighborhood)

#d
summary_stats_top_neighborhoods<-airbnb_top_neighborhoods %>%
  group_by(neighborhood) %>%
  summarise(avg_square_feet=mean(square_feet,na.rm=TRUE),avg_price=mean(price,na.rm=TRUE),sd_price=sd(price,na.rm=TRUE),max_price=max(price,na.rm=TRUE),min_price=min(price,na.rm=TRUE)) %>%
  arrange(desc(avg_square_feet)) 

#e
highest_avg_square_ft <- summary_stats_top_neighborhoods[1,"avg_square_feet"]

#f
second_avg_price<-summary_stats_top_neighborhoods[2,"avg_square_feet"]

