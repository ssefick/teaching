#1
#Setup a new working dicrectory.
setwd("C:/Users/Administrator/Desktop/SEO_HW9")

#2 and 3
#install new packages and load a data.
install.packages(c("ggplot2", "grid"))
library(ggplot2)
data("mtcars")
#View(mtcars) #Use View() to see data in the RScript program

#4
#Change transmission type
mtcars[mtcars$am==1, "am"] <- "automatic"
mtcars[mtcars$am==0, "am"] <- "manual"

#5 and 6
#Make plots with different values
plot5 <- qplot(mpg, data=mtcars, geom="histogram", bins=5, fill=am, col=am, xlab="Miles per gallon", ylab="Total count")
plot6_1 <- qplot(as.factor(cyl), mpg, data=mtcars, geom="boxplot", xlab="Number of cylendars", ylab="Miles per gallon")
plot6_2 <- qplot(as.factor(gear), mpg, data=mtcars, geom="boxplot", xlab="Number of gears", ylab="Miles per gallon")

#7
#Make a facet with the am object
plot7 <- plot5+facet_wrap(~am)

#8 and 9
#Make several plots following the direction
qplot(hp, mpg, data=mtcars, xlab="Horsepower", ylab="Miles per gallon") #scatterplot
qplot(hp, mpg, data=mtcars, xlab="Horsepower", ylab="Miles per gallon")+geom_smooth() #scatterplot with a line
qplot(hp, mpg, data=mtcars, xlab="Horsepower", ylab="Miles per gallon")+geom_smooth(method="loess")

#10
qplot(log(hp), log(mpg), data=mtcars, xlab="Horsepower (log)", ylab="Miles per gallon (log)")+geom_smooth() 
#10answer; No. It shows both hp and mpg have a negative relationship, but not linear.

#11
qplot(log(hp), log(mpg), data=mtcars, xlab="Horsepower (log)", ylab="Miles per gallon (log)")+geom_smooth(method="lm")

#12~14
plot11 <- qplot(log(hp), log(mpg), data=mtcars, xlab="Horsepower (log)", ylab="Miles per gallon (log)")+geom_smooth(method="lm")
plot11+facet_wrap(~am)
#13answer; Even though the x and y intercept is not shown in both plots, the intercepts is different from each other because of the angle of slopes.
#14answer; Nope.

#15
plot15 <- qplot(log(hp), log(mpg), data=mtcars, col=am, xlab="Horsepower (log)", ylab="Miles per gallon (log)")+geom_smooth(method="lm")

#17
#qplot(hp, mpg, data=mtcars, geom="blank", xlab="Horsepower", ylab="Miles per gallon") #Nothing
#qplot(hp, mpg, data=mtcars, geom="blank", xlab="Horsepower", ylab="Miles per gallon")+facet_grid(gear~am) #Make six block because of the separation of gear and am variables
mpg_hp_gear_trans_cyl <- qplot(hp, mpg, data=mtcars, geom="blank", xlab="Horsepower", ylab="Miles per gallon")+facet_grid(gear~am)
mpg_hp_gear_trans_cyl+geom_point(aes(color=as.factor(cyl))) #Points
plot17 <- mpg_hp_gear_trans_cyl+geom_point(aes(color=as.factor(cyl)))+geom_smooth(method="lm") #Points with a line

#Final; store all plots into the one file.
pdf("SEO_Ex1.pdf")
plot5
plot6_1
plot6_2
plot7
plot15
plot17
dev.off()
