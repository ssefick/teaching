install.packages(c("ggplot2", "grid"))
library(ggplot2)
data("mtcars")

mtcars[mtcars$am==1,"am"] <- "automatic"
mtcars[mtcars$am==0,"am"] <- "manual"

qplot(mpg, data = mtcars, geom = "histogram", bins = 5, fill = am, col = am)

cybo <- qplot(as.factor(cyl), mpg, data = mtcars, geom = "boxplot")
cybo <- cybo + facet_wrap(~am)
plot_6a <- cybo <- cybo + labs(title = "Automobile Data", x="Cylinders")

grbo <- qplot(as.factor(gear), mpg, data = mtcars, geom = "boxplot")
grbo <- grbo + facet_wrap(~am)
plot_6b <- grbo <- grbo + labs(title = "Automobile Data", x = "Gears")

hrs <- qplot(mtcars$hp, mpg, data = mtcars)
hrs <- hrs + labs(title = "Automobile Data", x = "Horsepower")
hrs <- hrs + geom_smooth()

plot_15 <- qplot(log(hp), log(mpg), data = mtcars) + geom_smooth()

nhrsbig <- qplot(hp, mpg, data = mtcars, geom = "blank") + facet_grid(gear~am)
plot_17 <- nhrsbig <- nhrsbig + geom_smooth(method = "lm") + geom_point(aes(color=as.factor(cyl)))

pdf("Clark_Ex1.pdf")
plot_5
plot_6a
plot_6b
plot_15
plot_17
dev.off()