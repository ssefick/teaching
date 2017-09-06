####Hw9 exercise1####

#install.packages(c("ggplot2", "grid"))
library(ggplot2)
data("mtcars")

mtcars[mtcars$am==1,"am"]<- "automatic"
mtcars[mtcars$am==0,"am"]<- "manual"

qplot(mpg, data=mtcars, geom="histogram", bins=5, fill=am, col=am)

cyl_box<-qplot(as.factor(cyl),mpg,data=mtcars,geom="boxplot",xlab="number of cylendars")
gear_box<-qplot(as.factor(gear),mpg,data=mtcars,geom="boxplot",xlab="number of gears")
gear_box+theme_bw()
transmission_box<-qplot(as.factor(am),mpg,data=mtcars,geom="boxplot",xlab="transmission")
transmission_box+facet_wrap(~am)

hp_mpg<-qplot(hp,mpg,data=mtcars,xlab="HP")
hp_mpg
hp_smooth<-hp_mpg+geom_smooth()
hp_smooth

loghp<-qplot(log(hp), mpg, data=mtcars)
loghp+geom_smooth()

loghpmpg<-qplot(log(hp), log(mpg), data=mtcars)
loghpmpg
loghpmpgsmooth<-loghpmpg+geom_smooth(method="lm")
loghpmpgsmooth

qplot(log(hp), log(mpg), data=mtcars, col=am)+geom_smooth()

mpg_hp_gear_trans_cyl<-qplot(hp, mpg, data=mtcars, geom="blank")+facet_grid(gear~am)
mpg_hp_gear_trans_cyl+geom_smooth(method="lm")+geom_point(aes(color=as.factor(cyl)))

pdf("DalisEx1.pdf")
qplot(mpg, data=mtcars, geom="histogram", bins=5, fill=am, col=am)
qplot(as.factor(cyl),mpg,data=mtcars,geom="boxplot",xlab="number of cylendars")
qplot(as.factor(gear),mpg,data=mtcars,geom="boxplot",xlab="number of gears")
qplot(log(hp), log(mpg), data=mtcars, col=am)+geom_smooth()
mpg_hp_gear_trans_cyl+geom_smooth(method="lm")+geom_point(aes(color=as.factor(cyl)))
dev.off()

####Exercise 2####
vel_exp=read.csv(file="experiment_velocity_time_series.csv")
library(ggplot2)
vel_exp$date<-as.Date(vel_exp$date)

vel_exp_plot<-qplot(date, velocity, data=vel_exp, geom="line", col=block, xlab="Date", ylab="Velocity")
vel_exp_plot
vel_exp_plot + facet_wrap(~block)

source("publication_ggplot2_theme.R")

pdf("Dalis_Ex2.pdf", height=20, width=20)

vel_exp_plot + facet_wrap(~block) +publication()

dev.off()