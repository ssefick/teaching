###Mazzola_Ex2

#read in data 
vel_exp <- read.csv("experiment_velocity_time_series.csv")

#adjust date 
library(ggplot2)
library(grid)
vel_exp$date <- as.Date(vel_exp$date)

#plot date against velocity 
plot_1<-qplot(date, velocity, data = vel_exp, xlab="Date", ylab="Velocity")
plot_1<-plot_1+geom_point(aes(color=as.factor(block)))

#add color against block
plot_1<-plot_1+facet_wrap("block")
plot_1<-plot_1+theme_bw()
plot_1

source("publication_ggplot2_theme.R") 
plot_1<-plot_1+publication()
plot_1

#make pdf
pdf("Mazzola_Ex2.pdf", width = 11, height = 8.5)
plot_1
dev.off()


