###DAVIS_Ex1

#install ggplot
install.packages(c("ggplot2", "grid"))

#load ggplot2 package and grid
library(ggplot2)
data(mtcars)

#rename transmission type column "am"
mtcars[mtcars$am==1, "am"] <- "automatic"
mtcars[mtcars$am==0, "am"] <- "manual"

#make a histogram
plot_5<-qplot(mpg, data=mtcars, geom="histogram", bins=5, fill=am, col=am)

#make a boxplot of cylendars/gears vs MPG
cylendars<-qplot(as.factor(cyl),mpg, data=mtcars, geom="boxplot", ylab="MPG", xlab="Cylendars")+theme_bw()
plot_6c<-cylendars
gears<-qplot(as.factor(gear),mpg, data=mtcars, geom="boxplot", ylab="MPG", xlab="Gears")+theme_bw()
plot_6g<-gears

plot_7c<-cylendars+facet_wrap(~am)
plot_7g<-gears+facet_wrap(~am)

#make a scatterplot of hp to mpg
hp<-qplot(hp,mpg, data=mtcars, xlab="Horsepower", ylab="MPG")
hp+geom_smooth()

#log transformation
qplot(log(hp), log(mpg), data=mtcars)+geom_smooth()
qplot(log(hp), log(mpg), data=mtcars)+geom_smooth(method="lm")+facet_wrap(~am)

#log transform color
plot_15<-qplot(log(hp), log(mpg), data=mtcars, col=(am)+geom_smooth()
plot_15
               
#use grid to look at mpg, hp, gear, trans, and cyl
mpg_hp_gear_trans_cyl <- qplot(hp, mpg, data=mtcars, geom="blank")+facet_grid(gear~am)
plot_17<-mpg_hp_gear_trans_cyl+geom_smooth(method="lm")+geom_point(aes(color=as.factor(cyl)))

#make pdf of plots
pdf("Davis_Ex1.pdf")
plot_5
plot_6c
plot_6g
plot_7c
plot_7g
plot_15
plot_17
dev.off()
