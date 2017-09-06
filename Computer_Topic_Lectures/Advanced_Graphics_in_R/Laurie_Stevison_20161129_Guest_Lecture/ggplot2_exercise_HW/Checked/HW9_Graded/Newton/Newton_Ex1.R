#Nov 16 Exercise 1

setwd("~/Downloads")

#install ggplot2 and grid
install.packages(c("ggplot2","grid"))

#load ggplot2 and mtcars data
library(ggplot2)
data(mtcars)
View(mtcars)

#change transmission type to more intuitive coding
mtcars[mtcars$am==1,"am"] <- "automatic"
mtcars[mtcars$am==0,"am"] <- "manual"

#5-make histogram of mpg and color it by transmission type
plot_5 <- qplot(mpg, data=mtcars, geom="histogram", bins=5, fill=am, col=am)

#6-make 2 boxplots
plot_6 <- qplot(as.factor(cyl), mpg, data=mtcars, geom="boxplot", xlab="Transmission Type")

#7-add facet wrap to split up variables
plot_7 <- plot_6+facet_wrap(~am)

#make scatterplot 
a <- qplot(hp, mpg, data=mtcars, geom="point")
a <- a+geom_smooth(method="loess")

#15-log transform
c <- qplot(log(hp),log(mpg),data=mtcars, col=am)+geom_smooth(method="lm")
plot_15 <- c+facet_wrap(~am)


#17
d <- qplot(hp,mpg,data=mtcars,geom="blank")+facet_grid(gear~am)
plot_17 <- d+geom_smooth(method="lm")+geom_point(aes(color=as.factor(cyl)))


pdf("Newton_Ex1.pdf")
plot_5
plot_6
plot_7
plot_15
plot_17
dev.off()