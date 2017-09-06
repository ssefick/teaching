#Nov 16 Exercise 2

#read in dataset
vel_exp <- read.csv("experiment_velocity_time_series.csv")

#load ggplot2 and fix date so it will be recognized by ggplot2
library(ggplot2)
vel_exp$date <- as.Date(vel_exp$date)

#make pdf file of graph
pdf("Newton_Ex2.pdf")
#line graph colored by block
plot_1 <- qplot(date,velocity,data=vel_exp,geom="line", col=block)

#add customized theme to plot
source("publication_ggplot2_theme.R")
plot_1 <- plot_1+publication()
plot_1

dev.off()