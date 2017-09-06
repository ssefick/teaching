vel_exp <- read.csv("experiment_velocity_time_series.csv")
library(ggplot2)
vel_exp$date <- as.Date(vel_exp$date)
plot=qplot(date,velocity,group=block, data=vel_exp,col=block,main="Velocity vs Date",xlab="Date",ylab="Velocity")+geom_line()+ facet_wrap(~block)
source("publication_ggplot2_theme.R")
finalplot=plot+publication()
pdf("WANG_Ex2.pdf")
finalplot
dev.off()
