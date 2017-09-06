#Homework9 Excersise 1

#1,2,3 Package install and data 
install.packages(c("ggplot2", "grid"))
library(ggplot2)
data(mtcars)
View(mtcars)

#4.Modification of am data
mtcars[mtcars$am==1,"am"] <- "automatic"
mtcars[mtcars$am==0,"am"] <- "manual"

#5.Histogram to see the distribustion
plot_5=qplot(mpg, data=mtcars, geom="histogram", bins=5, fill=am, col=am)
#6.Boxplot of the data
#qplot(as.factor(c(rep("A",5), rep("B", 5))), 1:10, geom="boxplot")

qplot(as.factor(cyl), mpg, data=mtcars, geom="boxplot")
plot_6=qplot(as.factor(cyl), mpg, data=mtcars, xlab = deparse(substitute(cyl)), geom="boxplot")+theme_bw()

#7.To see the reletionship of the automatic and manual transmission (facet_wrap)
cyl=qplot(as.factor(cyl), mpg, data=mtcars, xlab = deparse(substitute(cyl)), geom="boxplot")+theme_bw()
gear=qplot(as.factor(gear), mpg, data=mtcars, xlab = deparse(substitute(gear)), geom="boxplot")+theme_bw()
cyl
gear
cyl+facet_wrap(~am)
gear+facet_wrap(~am)

#8.Relationship between horsepower and mpg
horsepower=qplot(as.factor(hp), mpg, data=mtcars, xlab = deparse(substitute(hp)), geom_scatterplot)
horsepower
#9.Smoother to explore relationship between horsepower and mpg
hp=qplot(hp, mpg, data=mtcars, xlab = deparse(substitute(hp)), geom_scatterplot) #as factor can't make any smooth
hp+geom_smooth() #Not linear  

#10.Log transforming of mpg and hp
qplot(log(hp), log(mpg), data=mtcars)+geom_smooth() # Not linear

#11.linear model of relationship between horsepower and mpg
qplot(log(hp), log(mpg), data=mtcars)+geom_smooth(method="lm")

#12.linear model of relationship between horsepower and mpg as facet.
qplot(log(hp), log(mpg), data=mtcars)+geom_smooth(method="lm")+facet_wrap(~am) #13.Yes #14.Yes
#15. Color these graphs by transmission type
plot_15=qplot(log(hp), log(mpg), data=mtcars, col=am)+geom_smooth() #16.Automatic
#17. geom_grid() the relationship of hp with mpg also adding the gear, transmission, and number of cylendars
mpg_hp_gear_trans_cyl <- qplot(hp, mpg, data=mtcars, geom="blank")+facet_grid(gear~am)
plot_17=mpg_hp_gear_trans_cyl+geom_smooth(method="lm")+geom_point(aes(color=as.factor(cyl)))

pdf("khan_Ex1.pdf")
plot_5
plot_6
plot_15
plot_17
dev.off()
