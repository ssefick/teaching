#################
#######(2)#######
###TIME SERIES###
###SANDY CREEK###
#################

vel_exp <- read.csv("experiment_velocity_time_series.csv")
library("ggplot2")
vel_exp$date <- as.Date(vel_exp$date)

velplot<-qplot(date,velocity,data=vel_exp,geom="line",col=block)+facet_wrap(~block)
source("publication_ggplot2_theme.R")
velplot2<-velplot+publication()
velplot
pdf("Westfall_Ex2.pdf",width=20,height=8.5)
velplot2
dev.off()
