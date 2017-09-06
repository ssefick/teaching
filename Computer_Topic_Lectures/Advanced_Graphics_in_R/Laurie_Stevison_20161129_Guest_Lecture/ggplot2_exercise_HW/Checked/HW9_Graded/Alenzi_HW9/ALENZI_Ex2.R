vel_exp <- read.csv("experiment_velocity_time_series.csv")
library(ggplot2)
vel_exp$date <- as.Date(vel_exp$date)
qplot((date), (velocity), data=vel_exp,col=block)+geom_smooth()
#no other variable so no facet
source("publication_ggplot2_theme.R")
plot1=qplot((date), (velocity), data=vel_exp,col=block)+geom_smooth()+publication()
pdf("alenzi_Ex2.pdf")
plot1
dev.off()