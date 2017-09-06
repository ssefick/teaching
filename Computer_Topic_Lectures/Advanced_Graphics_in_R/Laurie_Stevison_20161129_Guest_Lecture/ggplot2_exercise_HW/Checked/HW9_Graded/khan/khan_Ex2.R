#Homework9 Exercise 2

part2=read.csv(file="experiment_velocity_time_series.csv")
View(part2)
#1. Assign object
vel_exp <- read.csv("experiment_velocity_time_series.csv")

#2.load the ggplot2 library, and change Date to Date class
library(ggplot2)
vel_exp$date <- as.Date(vel_exp$date)

#3.Plot the relationship of Date with velocity as a line graph using qplot
qplot(date,velocity,data=vel_exp,col=block)

qplot(date,velocity,data=vel_exp)+geom_line()

#4.
qplot(date,velocity,data=vel_exp,col=block)+geom_line()

#5.
qplot(date,velocity,data=vel_exp,col=block)+facet_wrap(~velocity)
qplot(date,velocity,data=vel_exp,col=block)+facet_wrap(~block)

#6.
qplot(date,velocity,data=vel_exp,col=block)+geom_line()+theme_bw()

#7. Used provided script
source("publication_ggplot2_theme.R")

qplot(date,velocity,data=vel_exp,col=block)+geom_line()+publication()

#Final plot
my_ggplot2_plot_object=qplot(date,velocity,data=vel_exp,col=block)+geom_line()+publication()+theme_bw()

pdf("khan_Ex2.pdf")
my_ggplot2_plot_object
dev.off()