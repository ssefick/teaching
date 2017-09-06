####Lauren Lang-Homework #9-Exercise 1
library(ggplot2)
data("mtcars")

mtcars[mtcars$am==1,"am"] <- "automatic"
mtcars[mtcars$am==0,"am"] <- "manual"

###Plot_5 histogram by transmission type
qplot(mpg, data=mtcars, geom="histogram", bins=5, fill=am, col=am)
###Plot_6 boxplots
p6a <- qplot(as.factor(cyl), 
      mpg, data=mtcars, geom="boxplot", xlab = "number of cylinders")
p6b <- qplot(as.factor(gear), 
      mpg, data=mtcars, geom="boxplot", xlab = "number of gears")
###Plot_7
p7a <- p6a+facet_wrap(~am)
p7b <- p6b+facet_wrap(~am)
###Plot_8 scatterplot
p8 <- qplot(mpg, hp, data = mtcars)
###Plot_9 smoother
p9 <- p8+geom_smooth()
###Plot_10 The data don't look too linear, log transformation which makes it appear a little more linear
p10 <- qplot(log(hp), log(mpg), data=mtcars)+geom_smooth()
###Plot_11
p11 <- qplot(log(hp), log(mpg), data=mtcars)+geom_smooth(method="lm") 
###Plot_12
p12 <- p11+facet_wrap(~am)
###13-Yes, the intercept looks close to the same around 3.6
###14-Yes, the slope looks about the same
###Plot_15
p15 <- qplot(log(hp), log(mpg), data=mtcars, col=am)+geom_smooth()
###16-I would choose automatic to optimize mpg.
###Plot_17
p17 <- qplot(hp, mpg, data=mtcars, geom="blank")+facet_grid(gear~am)
p17b <- p17+geom_smooth(method="lm")+geom_point(aes(color=as.factor(cyl)))

pdf("Lang_Ex1.pdf")
qplot(mpg, data=mtcars, geom="histogram", bins=5, fill=am, col=am)
p6a
p6b
p7a
p7b
p15
p17b
dev.off()