library(ggplot2)
data(mtcars)

mtcars[mtcars$am==1,"am"] <- "automatic"
mtcars[mtcars$am==0,"am"] <- "manual"

histogram <- qplot(mpg, data=mtcars, geom="histogram", bins=5, fill=am, col=am)

boxplot.gear <- qplot(as.factor(gear), mpg, data=mtcars, geom="boxplot")+theme_bw()+facet_wrap(~am)

boxplot.cyl <- qplot(as.factor(cyl), mpg, data=mtcars, geom="boxplot")+theme_bw()+facet_wrap(~am)

qplot(hp, mpg, data=mtcars)+geom_smooth()

qplot(log(hp),log(mpg),data=mtcars)+geom_smooth(method="lm")+facet_wrap(~am)

qplot(log(hp),log(mpg),data=mtcars, col=am)+geom_smooth(method="lm")
