setwd("~/R stuff")
vel_exp <-read.csv(file="experiment_velocity_time_series.csv")
View(vel_exp)
library(ggplot2)
vel_exp$date <- as.Date(vel_exp$date)
myplot<-qplot(date,velocity, data=vel_exp, geom ='line', col=block)
#myplot+facet_wrap(~block)
source("publication_ggplot2_theme.R") 
myggplot<-myplot+publication()
myggplot
pdf("Gardner_Ex2.pdf") 
myggplot 
dev.off()

#Yes, velocity increases with time
#Yes, velocity varies with block
#The rainfall event occurred just after November 18th