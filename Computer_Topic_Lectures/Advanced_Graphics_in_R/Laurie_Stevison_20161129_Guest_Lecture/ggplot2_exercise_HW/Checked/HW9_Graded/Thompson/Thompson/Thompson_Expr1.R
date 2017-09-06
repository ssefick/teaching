####Part 1####
library(ggplot2)
data("mtcars")


mtcars[mtcars$am==1,"am"]<-"automatic"
mtcars[mtcars$am==0,"am"]<-"manual"

pdf(file="THOMPSON_Ex1.pdf")
qplot(mpg, data=mtcars, geom="histogram", bins=5, fill=am, col=am)+theme_bw()
qplot(as.factor(cyl), mpg, data=mtcars, geom='boxplot',xlab='cylinders')+facet_wrap(~am)+theme_bw()
qplot(as.factor(gear),mpg,data=mtcars,geom='boxplot',xlab='gears')+facet_wrap(~am)+theme_bw()
qplot(hp,mpg,data=mtcars,geom='point')+geom_smooth()
qplot(log(hp), log(mpg),data=mtcars,col=am)+geom_smooth(method='lm')+facet_wrap(~am)
qplot(hp, mpg, data=mtcars, geom="blank")+facet_grid(gear~am)+geom_smooth(method="lm")+geom_point(aes(color=as.factor(cyl)))
dev.off()




