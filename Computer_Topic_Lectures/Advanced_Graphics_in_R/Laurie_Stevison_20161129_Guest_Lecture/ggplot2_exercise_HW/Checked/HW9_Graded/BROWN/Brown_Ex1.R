##ggplot

install.packages(c("ggplot2","grid"))

library(ggplot2)

data(mtcars)

mtcars[mtcars$am==1,"am"] <- "automatic"
mtcars[mtcars$am==0,"am"] <- "manual"

plot_5 <- qplot(mpg, data=mtcars, geom="histogram", bins=5, fill=am, col=am)


plot_6a <- qplot(as.factor(gear),mpg,data=mtcars,geom="boxplot",ylab="MPG",xlab="Gears")+theme_bw()
plot_6b <- qplot(as.factor(cyl),mpg,data=mtcars,geom="boxplot",ylab="MPG",xlab="Cylinders")+theme_bw()

plot_7 <- plot_6b+facet_wrap(~am)

scat <- qplot(hp,mpg,data=mtcars,xlab="Horsepower",ylab="MPG")
plot_9 <- scat+geom_smooth()

qplot(log(hp), log(mpg), data=mtcars)+geom_smooth()

plot_11 <- qplot(log(hp), log(mpg), data=mtcars)+geom_smooth(method="lm")
plot_11+facet_wrap(~am)

plot_15 <- qplot(log(hp), log(mpg), data=mtcars, col=am)+geom_smooth()

mpg_hp_gear_trans_cyl <- qplot(hp, mpg, data=mtcars, geom="blank")+facet_grid(gear~am)
plot_17 <- mpg_hp_gear_trans_cyl+geom_smooth(method="lm")+geom_point(aes(color=as.factor(cyl)))

pdf("Brown_Ex1.pdf")
plot_5
plot_6a
plot_6b
plot_7
plot_15
plot_17
dev.off()
