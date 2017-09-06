####Powers_Ex1.R####

library(ggplot2)
data("mtcars")

View(mtcars)

pdf(file="POWERS_Ex1.pdf")
mtcars[mtcars$am==1,"am"]<-"automatic"
mtcars[mtcars$am==0,"am"]<-"manual"

qplot(mpg, data=mtcars,geom="histogram",bins=5,fill=am,col=am)

cylplot<-qplot(as.factor(cyl), mpg, data=mtcars, geom='boxplot',xlab='cylinders')
gearplot <-qplot(as.factor(gear),mpg,data=mtcars,geom='boxplot',xlab='gears')
cylplot+facet_wrap(~am)
gearplot+facet_wrap(~am)

hpplot<-qplot(hp,mpg,data=mtcars,geom='point')
hpplot+geom_smooth()

smoothplot<-qplot(log(hp), log(mpg),data=mtcars,col=am)+geom_smooth(method='lm')
smoothplot+facet_wrap(~am)

mpg_hp_gear_trans_cyl <- qplot(hp, mpg, data=mtcars, geom="blank")+facet_grid(gear~am)
mpg_hp_gear_trans_cyl+geom_smooth(method="lm")+geom_point(aes(color=as.factor(cyl)))
dev.off()

