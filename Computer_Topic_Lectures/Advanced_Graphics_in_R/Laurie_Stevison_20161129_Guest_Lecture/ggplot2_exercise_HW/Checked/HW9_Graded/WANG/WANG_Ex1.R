#step 2
install.packages("ggplot2")
install.packages("grid")
#step 3
library(ggplot2)
data(mtcars)
#step 4
mtcars[mtcars$am==1,"am"] <- "automatic"
mtcars[mtcars$am==0,"am"] <- "manual"
#step 5
plot5=qplot(mpg, data=mtcars, geom="histogram", bins=5, fill=am, col=am,main="Step.5 - Histogram")+theme_bw()
#step 6
plot_6_1=qplot(as.factor(gear), mpg, data=mtcars, geom="boxplot",main="Step.6 Plot 1 - Gears vs mpg",xlab="Gears")+theme_bw()
plot_6_2=qplot(as.factor(cyl), mpg, data=mtcars, geom="boxplot",main="Step.6 Plot 2 - Cylendars vs mpg",xlab="Cylendars")+theme_bw()
#step 7
plot_7_1=qplot(as.factor(gear), mpg, data=mtcars, geom="boxplot",main="Step.7 Plot 1 - Gears vs mpg",xlab="Gears")+theme_bw()+facet_wrap(~am)
plot_7_2=qplot(as.factor(cyl), mpg, data=mtcars, geom="boxplot",main="Step.7 Plot 2 - Cylendars vs mpg",xlab="Cylendars")+theme_bw()+facet_wrap(~am)
#step 8
plot8=qplot(hp, mpg, data=mtcars, geom="point")+theme_bw()
#step 9
plot9=plot8+geom_smooth()
#step10
plot10=qplot(log(hp), log(mpg), data=mtcars)+geom_smooth()+theme_bw()
#step11
plot11=qplot(log(hp), log(mpg), data=mtcars)+geom_smooth(method="lm")+theme_bw()
#step 12
plot12=plot11+facet_wrap(~am)+theme_bw()
#step 15
plot_15=qplot(log(hp), log(mpg), data=mtcars, col=am,main="Step.15 - log(hp) vs log(mpg)")+geom_smooth(method="lm")+theme_bw()
#step 17
mpg_hp_gear_trans_cyl = qplot(log(hp), log(mpg), data=mtcars, geom="blank",main="Step.17 - Multi-panel")+facet_grid(gear~am) 
plot_17=mpg_hp_gear_trans_cyl+geom_smooth(method="lm")+geom_point(aes(color=as.factor(cyl)))+theme_bw()
pdf("WANG_Ex1.pdf")
plot5
plot_6_1
plot_6_2
plot_7_1
plot_7_2
plot_15
plot_17
dev.off()
