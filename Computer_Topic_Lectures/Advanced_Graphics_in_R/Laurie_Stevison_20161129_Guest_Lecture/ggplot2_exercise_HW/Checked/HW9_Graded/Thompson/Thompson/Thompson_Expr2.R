####Part 2####
pdf(file="Thompson_Ex2.pdf")
vel_exp <- read.csv("experiment_velocity_time_series.csv")
library(ggplot2)
vel_exp$date <- as.Date(vel_exp$date)

source("publication_ggplot2_theme.R")
myplot<-qplot(date,velocity,data=vel_exp,geom='line',col=block)
myplot+publication()
dev.off()

####Answers to part 2 questions####
#1. Yes, the velocity varies. 
#2. Yes, the velocity varies among the blocks.
#3. It started to rain shortly after November 18th and stopped shortly after November 25th.

