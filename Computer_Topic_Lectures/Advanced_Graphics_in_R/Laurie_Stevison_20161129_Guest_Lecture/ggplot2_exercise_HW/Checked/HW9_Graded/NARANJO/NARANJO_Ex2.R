vel_exp <- read.csv("experiment_velocity_time_series.csv")
library(ggplot2)
vel_exp$date <- as.Date(vel_exp$date)
View(vel_exp)
qplot(date, velocity, data=vel_exp, color=block)
date=vel_exp$date
p1<-qplot(date, velocity, data=vel_exp, color=block, xlab="Date") + geom_smooth(method="lm", se=FALSE)

source("publication_ggplot2_theme.R")
p1+facet_wrap(~block)+publication()
p1+facet_wrap(~block)+theme_dark()+ggtitle("Time variation of the speed per block")
myplot<-p1+facet_wrap(~block)+theme_dark()+ggtitle("Time variation of the speed per block")
pdf("NARANJO_Ex2.pdf")
myplot
dev.off()
  