####POWERS_Ex2.R####

pdf(file="POWERS_Ex2.pdf")
vel_exp <- read.csv("experiment_velocity_time_series.csv")
library(ggplot2)
vel_exp$date <- as.Date(vel_exp$date)

source("publication_ggplot2_theme.R")
myplot<-qplot(date,velocity,data=vel_exp,geom='line',col=block)
myplot+publication()
dev.off()

####Answers to part 2 questions####
#1.Yes, velocity varies across the dates on which measurements were taken. 
#2.Even without making a facet of the data, we can see variation in velocity among the blocks shown by the different colored lines on our plot.
#3. It looks like the rain began shortly after November 18th and continued just past November 25th, according to our graph.
