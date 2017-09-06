#1
#Setup a new working dicrectory and load a data from the csv file.
setwd("C:/Users/Administrator/Desktop/SEO_HW9")
vel_exp <- read.csv("experiment_velocity_time_series.csv")

#2
#Load the ggplot2 library and change the date object as date class
library(ggplot2)
vel_exp$date <- as.Date(vel_exp$date)

#3 and 4
#make a line plot using qplot() and the geom_line()
qplot(date, velocity, data=vel_exp, xlab="Date", ylab="Verocity (m/s)")+geom_line()
qplot(date, velocity, data=vel_exp, col=block, xlab="Date", ylab="Verocity (m/s)")+geom_line()

#5
#Make a facet with the block object
plot4 <- qplot(date, velocity, data=vel_exp, col=block, xlab="Date", ylab="Verocity (m/s)")+geom_line()
plot4+facet_wrap(~block)

#6
#If qplot() is not working, remove '#' and run again for the next command.
#plot4 <- qplot(date, velocity, data=vel_exp, col=block, xlab="Date", ylab="Verocity (m/s)")+geom_line()
#Apply "theme-ing" system. As a result, the background is changed as the white color.
plot4+theme_bw()
plot4+theme_light()

#7
#Customize the plot using the already written R script.
library(grid)
source("publication_ggplot2_theme.R")
plot4+publication()
summary(vel_exp$date)

#8
pdf(file="SEO_Ex2.pdf")
plot4+publication()
dev.off()