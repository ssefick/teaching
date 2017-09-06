####Part1####
#install.packages(c("ggplot2", "grid"))
#library(ggplot)
data("mtcars")
mtcars[mtcars$am==1,"am"] <- "automatic"
mtcars[mtcars$am==0, "am"] <- "manual"
mtcars
plot_5 <- qplot(mpg, data=mtcars, geom="histogram", bins=5, fill=am, col=am)

####Part2####
plot_6 <- qplot(as.factor(mtcars$cyl), mpg, data=mtcars, geom="boxplot", xlab = "Number of Cylinder")+theme_bw()
as.factor(mtcars$cyl)
myplot + facet_wrap(~am)
plot_7 <- myplot + facet_wrap(~am)

####SCATTERPLOT####
horsepwr <- qplot(mtcars$hp, mtcars$mpg)
horsepwr+geom_smooth()
#log transformation
qplot(log(hp),log(mpg), data=mtcars)+geom_smooth()
horsepwrlin <- qplot(log(hp),log(mpg), data=mtcars)+geom_smooth(method="lm")
head(mtcars)
#transmission type included as a facet
horsepwrlin+facet_wrap(~am)
#coloration, yay
plot_15 <- qplot(log(hp),log(mpg), data=mtcars, col=am)+geom_smooth(method="lm")
horsepwrlincol
mpg_hp_gear_trans_cyl <- qplot(hp, mpg, data=mtcars, geom="blank")+facet_grid(gear~am)
plot_17 <- mpg_hp_gear_trans_cyl+geom_smooth(method="lm")+geom_point(aes(color=as.factor(cyl)))

pdf("Sipley_Ex1.pdf")
plot_5
plot_6
plot_15
plot_17
dev.off()
