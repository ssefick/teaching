install.packages(c("ggplot2", "grid"))
library(ggplot2)
data(mtcars)
mtcars[mtcars$am==1,"am"] <- "automatic"
mtcars[mtcars$am==0,"am"] <- "manual"
plot1=qplot(mpg, data=mtcars, geom="histogram", bins=5, fill=am, col=am)
plot2=qplot(as.factor(gear), mpg, data=mtcars, geom="boxplot",xlab = "gear")+theme_bw()
plot3=qplot(as.factor(cyl), mpg, data=mtcars, geom="boxplot",xlab = "cyl")+theme_bw()
qplot(as.factor(gear), mpg, data=mtcars, geom="boxplot",xlab = "gear")+theme_bw()+facet_wrap(~am)
qplot(as.factor(cyl), mpg, data=mtcars, geom="boxplot",xlab = "cyl")+theme_bw()+facet_wrap(~am)
qplot(hp,mpg,data = mtcars)+geom_smooth()
#not linear
qplot(log(hp), log(mpg), data=mtcars)+geom_smooth(method="lm")
#yes does linear
qplot(log(hp), log(mpg), data=mtcars)+geom_smooth(method="lm")+facet_wrap(~am)
#not the same
#slope is the same
plot4=qplot(log(hp), log(mpg), data=mtcars, col=am)+geom_smooth()
#automatic is better
mpg_hp_gear_trans_cyl <- qplot(hp, mpg, data=mtcars, geom="blank")+facet_grid(gear~am)
plot5=mpg_hp_gear_trans_cyl+geom_smooth(method="lm")+geom_point(aes(color=as.factor(cyl)))
pdf("alenzi_Ex1.pdf")
plot1
plot2
plot3
plot4
plot5
dev.off()