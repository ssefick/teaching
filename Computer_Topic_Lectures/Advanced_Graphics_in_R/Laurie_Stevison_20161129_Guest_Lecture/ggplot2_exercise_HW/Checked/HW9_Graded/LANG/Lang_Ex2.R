## Lauren Lang-Homework 9 Exercise 2
###Step 1
vel_exp <- read.csv("experiment_velocity_time_series.txt")
###Step 2
library(ggplot2)
vel_exp$date <- as.Date(vel_exp$date)
###Step 3
qplot(date, velocity, data = vel_exp)
###Step 4
qplot(date, velocity, data = vel_exp, col = block)
###Step 5
qplot(date, velocity, data = vel_exp, col = block)+facet_wrap(~block)
###Step 6
p6 <- qplot(date, velocity, data = vel_exp, col = block)+facet_wrap(~block)+theme_bw()
###Step 7
source("publication_ggplot2_theme-1.R")
qplot(date, velocity, data = vel_exp, col = block)+facet_wrap(~block)+publication()
###Step 8
pdf("Lang_Ex2.pdf")
qplot(date, velocity, data = vel_exp, col = block)+facet_wrap(~block)+theme_bw()
dev.off
###Step 9


