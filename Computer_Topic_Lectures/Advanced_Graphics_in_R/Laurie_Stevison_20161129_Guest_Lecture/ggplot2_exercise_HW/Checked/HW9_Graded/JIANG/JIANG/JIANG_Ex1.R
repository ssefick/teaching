# install ggplot2 and grid
install.packages(c("ggplot2", "grid"))
library(ggplot2)
#input data set
data(mtcars)
#save mtcars$am as numeric
mtcars[mtcars$am==1,"am"] <- "automatic"
mtcars[mtcars$am==0,"am"] <- "manual"
#histogram of mpg
qplot(mpg, data=mtcars, geom="histogram", bins=5, fill=am, col=am)
#boxplot to explore the effectof gears and cylendars
qplot(as.factor(cyl), mpg, data=mtcars, geom="boxplot",xlab = "Cylinder")+theme_bw()
qplot(as.factor(gear), mpg, data=mtcars, geom="boxplot", xlab = "Gear")+theme_bw()
#devide into groups
qplot(as.factor(cyl), mpg, data=mtcars, geom="boxplot",xlab = "Cylinder")+theme_bw()+facet_wrap(~am)
qplot(as.factor(gear), mpg, data=mtcars, geom="boxplot", xlab = "Gear")+theme_bw()+facet_wrap(~am)
# scatterplot
plot(mtcars$hp,mtcars$mpg)
#use lowess smoothing line
qplot(hp, mpg, data = mtcars)+theme_bw()+geom_smooth(method = 'loess')
#logtransform
qplot(log(hp), log(mpg), data=mtcars)+geom_smooth(method = 'loess')
#logtransform with linear model
qplot(log(hp), log(mpg), data=mtcars)+geom_smooth(method="lm")
#add facet()
qplot(log(hp), log(mpg), data=mtcars)+geom_smooth(method="lm")+facet_wrap(~am)
#setting color and shape
qplot(log(hp), log(mpg), data=mtcars, col=am)+geom_smooth(method = 'loess')
#final plot by organizing several functions
mpg_hp_gear_trans_cyl <- qplot(log(hp), log(mpg), data=mtcars, geom="blank")+facet_grid(gear~am) 
mpg_hp_gear_trans_cyl+geom_smooth(method="lm")+geom_point(aes(color=as.factor(cyl)))
#save plots from 5,6,7,15,17 into a single pdf
pdf("JIANG_Ex1.pdf")
qplot(mpg, data=mtcars, geom="histogram", bins=5, fill=am, col=am)
qplot(as.factor(cyl), mpg, data=mtcars, geom="boxplot",xlab = "Cylinder")+theme_bw()
qplot(as.factor(gear), mpg, data=mtcars, geom="boxplot", xlab = "Gear")+theme_bw()
qplot(as.factor(cyl), mpg, data=mtcars, geom="boxplot",xlab = "Cylinder")+theme_bw()+facet_wrap(~am)
qplot(as.factor(gear), mpg, data=mtcars, geom="boxplot", xlab = "Gear")+theme_bw()+facet_wrap(~am)
qplot(log(hp), log(mpg), data=mtcars, col=am)+geom_smooth(method = 'loess')
mpg_hp_gear_trans_cyl <- qplot(log(hp), log(mpg), data=mtcars, geom="blank")+facet_grid(gear~am) 
mpg_hp_gear_trans_cyl+geom_smooth(method="lm")+geom_point(aes(color=as.factor(cyl)))
dev.off()