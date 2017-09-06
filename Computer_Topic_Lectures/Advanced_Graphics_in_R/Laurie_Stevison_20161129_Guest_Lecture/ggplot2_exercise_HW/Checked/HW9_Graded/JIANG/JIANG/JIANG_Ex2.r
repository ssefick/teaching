setwd("~/Desktop/HW9/Time_Series")
#read in data
vel_exp <- read.csv("experiment_velocity_time_series.csv")
#must change date into class Date in order to have qplot recognize as such.
library(ggplot2)
vel_exp$date <- as.Date(vel_exp$date)
#plot
qplot(date, velocity, data=vel_exp, col=block)+facet_wrap(~block)
qplot(date, velocity, data=vel_exp, col=block)+theme_bw()+facet_wrap(~block)
#use my publication theme
setwd("~/Desktop/HW9")
source("publication_ggplot2_theme.R") 
qplot(date, velocity, data=vel_exp, col=block)+publication()
qplot(date, velocity, data=vel_exp, col=block)+theme_bw()+facet_wrap(~block)+publication()
qplot(date, velocity, data=vel_exp, col=block)+facet_wrap(~block)+publication()
#choose the final plot and save it
pdf("JIANG_Ex2.pdf") 
qplot(date, velocity, data=vel_exp, col=block)+theme_bw()+facet_wrap(~block)
dev.off()