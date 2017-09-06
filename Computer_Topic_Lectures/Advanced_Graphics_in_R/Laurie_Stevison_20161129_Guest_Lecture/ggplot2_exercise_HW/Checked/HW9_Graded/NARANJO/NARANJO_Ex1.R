#HW9
library(grid)
library(ggplot2)
View(mtcars)

#Changing am to categorical values
mtcars[mtcars$am==1,"am"] <- "automatic"
mtcars[mtcars$am==0,"am"] <- "manual"
head(mtcars)


# 5 Histogram of mpg,color by transmission type (quite normal)
p1<-qplot(mpg, data=mtcars, geom="histogram", fill=am, bins=5, col=am)
p1
plot_5<-p1

# 6 Boxplots

p2<-qplot(as.factor(cyl), mpg, data = mtcars, geom = c("boxplot", "jitter"), xlab="Number of cylinders", fill=cyl,)
p3<-qplot(as.factor(gear), mpg, data = mtcars, geom = c("boxplot", "jitter"), xlab="Number of gears", fill=gear,)

p2 + theme_grey()
p3 + theme_light()

plot_6<-p2 + theme_grey()
plot_7<-p3 + theme_light()

#Relationship Whith mpg
p5<-qplot(am, mpg,data=mtcars, col=am, xlab="Transmission type")
p5 + facet_wrap(~am)
plot_8<-p5 + facet_wrap(~am)

#hp vs mpg
p6<-qplot(hp, mpg, data=mtcars)
p6
p6 + geom_smooth(method=loess)

#with log transformation,It looks closer to a lineal relationship
p7<-qplot(log(hp), log(mpg), data=mtcars)
p7 + geom_smooth(method=loess)

#Adjusting a linear model
p8<-qplot(log(hp), log(mpg), data=mtcars)
p8 + geom_smooth(method="lm")
p9<-p8 + geom_smooth(method="lm")

#Exploring relationship with transmission, with linear model, log transformation??
p9 +facet_wrap(~am)
p10<-p9 +facet_wrap(~am)
#lower intercept for manual
#pretty similar slopes

#Coloring by am
qplot(log(hp), log(mpg), data=mtcars, col=am)+ geom_smooth(method="lm")
plot_10<-qplot(log(hp), log(mpg), data=mtcars, col=am)+ geom_smooth(method="lm", se=FALSE)
plot_10

#17
p10 <- qplot(log(hp), log(mpg), data=mtcars)
p11<-p10 + geom_point(aes(color=as.factor(cyl))) + facet_grid(gear~am)
p12<-p11 + geom_smooth(method="lm", se=FALSE, col="black")
plot_11<-p12
plot_11

#Put plots in pdf files
pdf("NARANJO_Ex1.pdf")
plot_5
plot_6
plot_7
plot_8
plot_9
plot_10
plot_11
dev.off()






